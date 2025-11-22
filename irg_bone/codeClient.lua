sx,sy,sz = 0,0,3
tx,ty,tz = 0,0,4
fx,fy,fz = 0,1,3

function getMatrixFromPoints(x,y,z,x3,y3,z3,x2,y2,z2)
	x3 = x3-x
	y3 = y3-y
	z3 = z3-z
	x2 = x2-x
	y2 = y2-y
	z2 = z2-z
	local x1 = y2*z3-z2*y3
	local y1 = z2*x3-x2*z3
	local z1 = x2*y3-y2*x3
	x2 = y3*z1-z3*y1
	y2 = z3*x1-x3*z1
	z2 = x3*y1-y3*x1
	local len1 = 1/math.sqrt(x1*x1+y1*y1+z1*z1)
	local len2 = 1/math.sqrt(x2*x2+y2*y2+z2*z2)
	local len3 = 1/math.sqrt(x3*x3+y3*y3+z3*z3)
	x1 = x1*len1 y1 = y1*len1 z1 = z1*len1
	x2 = x2*len2 y2 = y2*len2 z2 = z2*len2
	x3 = x3*len3 y3 = y3*len3 z3 = z3*len3
	return x1,y1,z1,x2,y2,z2,x3,y3,z3
end

function getEulerAnglesFromMatrix(x1,y1,z1,x2,y2,z2,x3,y3,z3)
	local nz1,nz2,nz3
	nz3 = math.sqrt(x2*x2+y2*y2)
	nz1 = -x2*z2/nz3
	nz2 = -y2*z2/nz3
	local vx = nz1*x1+nz2*y1+nz3*z1
	local vz = nz1*x3+nz2*y3+nz3*z3
	return math.deg(math.asin(z2)),-math.deg(math.atan2(vx,vz)),-math.deg(math.atan2(x2,y2))
end

function getMatrixFromEulerAngles(x,y,z)
	x,y,z = math.rad(x),math.rad(y),math.rad(z)
	local sinx,cosx,siny,cosy,sinz,cosz = math.sin(x),math.cos(x),math.sin(y),math.cos(y),math.sin(z),math.cos(z)
	return
		cosy*cosz-siny*sinx*sinz,cosy*sinz+siny*sinx*cosz,-siny*cosx,
		-cosx*sinz,cosx*cosz,sinx,
		siny*cosz+cosy*sinx*sinz,siny*sinz-cosy*sinx*cosz,cosy*cosx
end

if not script_serverside then
	function getBoneMatrix(ped,bone)
		local x,y,z,tx,ty,tz,fx,fy,fz
		x,y,z = getPedBonePosition(ped,bone_0[bone])
		if bone == 1 then
			local x6,y6,z6 = getPedBonePosition(ped,6)
			local x7,y7,z7 = getPedBonePosition(ped,7)
			tx,ty,tz = (x6+x7)*0.5,(y6+y7)*0.5,(z6+z7)*0.5
		elseif bone == 3 then
			local x21,y21,z21 = getPedBonePosition(ped,21)
			local x31,y31,z31 = getPedBonePosition(ped,31)
			tx,ty,tz = (x21+x31)*0.5,(y21+y31)*0.5,(z21+z31)*0.5
		else
			tx,ty,tz = getPedBonePosition(ped,bone_t[bone])
		end
		fx,fy,fz = getPedBonePosition(ped,bone_f[bone])
		local xx,xy,xz,yx,yy,yz,zx,zy,zz = getMatrixFromPoints(x,y,z,tx,ty,tz,fx,fy,fz)
		if bone == 1 or bone == 3 then xx,xy,xz,yx,yy,yz = -yx,-yy,-yz,xx,xy,xz end
		return xx,xy,xz,yx,yy,yz,zx,zy,zz
	end
end

attached_ped = {}
attached_bone = {}
attached_x = {}
attached_y = {}
attached_z = {}
attached_rx = {}
attached_ry = {}
attached_rz = {}

function attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
	if not (isElement(element) and isElement(ped)) then return false end
	if getElementType(ped) ~= "ped" and getElementType(ped) ~= "player" then return false end
	bone = tonumber(bone)
	if not bone or bone < 1 or bone > 20 then return false end
	x,y,z,rx,ry,rz = tonumber(x) or 0,tonumber(y) or 0,tonumber(z) or 0,tonumber(rx) or 0,tonumber(ry) or 0,tonumber(rz) or 0
	attached_ped[element] = ped
	attached_bone[element] = bone
	attached_x[element] = x
	attached_y[element] = y
	attached_z[element] = z
	attached_rx[element] = rx
	attached_ry[element] = ry
	attached_rz[element] = rz
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element,false)
	end
	if script_serverside then
		triggerClientEvent("boneAttach_attach",root,element,ped,bone,x,y,z,rx,ry,rz)
	end
	return true
end

function detachElementFromBone(element)
	if not element then return false end
	if not attached_ped[element] then return false end
	clearAttachmentData(element)
	if setElementCollisionsEnabled then
		setElementCollisionsEnabled(element,true)
	end
	if script_serverside then
		triggerClientEvent("boneAttach_detach",root,element)
	end
	return true
end

function isElementAttachedToBone(element)
	if not element then return false end
	return isElement(attached_ped[element])
end

function getElementBoneAttachmentDetails(element)
	if not isElementAttachedToBone(element) then return false end
	return attached_ped[element],attached_bone[element],
		attached_x[element],attached_y[element],attached_z[element],
		attached_rx[element],attached_ry[element],attached_rz[element]
end

function setElementBonePositionOffset(element,x,y,z)
	local ped,bone,ox,oy,oz,rx,ry,rz = getElementBoneAttachmentDetails(element)
	if not ped then return false end
	return attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
end

function setElementBoneRotationOffset(element,rx,ry,rz)
	local ped,bone,x,y,z,ox,oy,oz = getElementBoneAttachmentDetails(element)
	if not ped then return false end
	return attachElementToBone(element,ped,bone,x,y,z,rx,ry,rz)
end

if not script_serverside then
	function getBonePositionAndRotation(ped,bone)
		bone = tonumber(bone)
		if not bone or bone < 1 or bone > 20 then return false end
		if not isElement(ped) then return false end
		if getElementType(ped) ~= "player" and getElementType(ped) ~= "ped" then return false end
		if not isElementStreamedIn(ped) then return false end
		local x,y,z = getPedBonePosition(ped,bone_0[bone])
		local rx,ry,rz = getEulerAnglesFromMatrix(getBoneMatrix(ped,bone))
		return x,y,z,rx,ry,rz
	end
end

------------------------------------

function clearAttachmentData(element)
	attached_ped[element] = nil
	attached_bone[element] = nil
	attached_x[element] = nil
	attached_y[element] = nil
	attached_z[element] = nil
	attached_rx[element] = nil
	attached_ry[element] = nil
	attached_rz[element] = nil
end

function forgetDestroyedElements()
	if not attached_ped[source] then return end
	clearAttachmentData(source)
end
addEventHandler(script_serverside and "onElementDestroy" or "onClientElementDestroy",root,forgetDestroyedElements)

function forgetNonExistingPeds()
	local checkedcount = 0
	while true do
		for element,ped in pairs(attached_ped) do
			if not isElement(ped) then clearAttachmentData(element) end
			checkedcount = checkedcount+1
			if checkedcount >= 1000 then
				coroutine.yield()
				checkedcount = 0
			end
		end
		coroutine.yield()
	end
end
clearing_nonexisting_peds = coroutine.create(forgetNonExistingPeds)
setTimer(function()	coroutine.resume(clearing_nonexisting_peds) end,1000,0)


function sendReadyMessage()
	triggerServerEvent("boneAttach_requestAttachmentData",root)
end
addEventHandler("onClientResourceStart",resourceRoot,sendReadyMessage)

function getAttachmentData(ped,bone,x,y,z,rx,ry,rz)
	for element,att_ped in pairs(ped) do
		setElementCollisionsEnabled(element,false)
		attached_ped[element] = att_ped
		attached_bone[element] = bone[element]
		attached_x[element] = x[element]
		attached_y[element] = y[element]
		attached_z[element] = z[element]
		attached_rx[element] = rx[element]
		attached_ry[element] = ry[element]
		attached_rz[element] = rz[element]
	end
end
addEvent("boneAttach_sendAttachmentData",true)
addEventHandler("boneAttach_sendAttachmentData",root,getAttachmentData)

function initAttach()
	addEvent("boneAttach_attach",true)
	addEvent("boneAttach_detach",true)
	addEventHandler("boneAttach_attach",root,attachElementToBone)
	addEventHandler("boneAttach_detach",root,detachElementFromBone)
end
addEventHandler("onClientResourceStart",resourceRoot,initAttach)

bone_0,bone_t,bone_f = {},{},{}
bone_0[1],bone_t[1],bone_f[1] = 5,nil,6 --head
bone_0[2],bone_t[2],bone_f[2] = 4,5,8 --neck
bone_0[3],bone_t[3],bone_f[3] = 3,nil,31 --spine
bone_0[4],bone_t[4],bone_f[4] = 1,2,3 --pelvis
bone_0[5],bone_t[5],bone_f[5] = 4,32,5 --left clavicle
bone_0[6],bone_t[6],bone_f[6] = 4,22,5 --right clavicle
bone_0[7],bone_t[7],bone_f[7] = 32,33,34 --left shoulder
bone_0[8],bone_t[8],bone_f[8] = 22,23,24 --right shoulder
bone_0[9],bone_t[9],bone_f[9] = 33,34,32 --left elbow
bone_0[10],bone_t[10],bone_f[10] = 23,24,22 --right elbow
bone_0[11],bone_t[11],bone_f[11] = 34,35,36 --left hand
bone_0[12],bone_t[12],bone_f[12] = 24,25,26 --right hand
bone_0[13],bone_t[13],bone_f[13] = 41,42,43 --left hip
bone_0[14],bone_t[14],bone_f[14] = 51,52,53 --right hip
bone_0[15],bone_t[15],bone_f[15] = 42,43,44 --left knee
bone_0[16],bone_t[16],bone_f[16] = 52,53,54 --right knee
bone_0[17],bone_t[17],bone_f[17] = 43,42,44 --left ankle
bone_0[18],bone_t[18],bone_f[18] = 53,52,54 --right angle
bone_0[19],bone_t[19],bone_f[19] = 44,43,42 --left foot
bone_0[20],bone_t[20],bone_f[20] = 54,53,52 --right foot

function putAttachedElementsOnBones()
	for element,ped in pairs(attached_ped) do
		if not isElement(element) then
			clearAttachmentData(element)
		elseif isElementStreamedIn(ped) then
			local bone = attached_bone[element]
			local x,y,z = getPedBonePosition(ped,bone_0[bone])
			local xx,xy,xz,yx,yy,yz,zx,zy,zz = getBoneMatrix(ped,bone)
			local offx,offy,offz = attached_x[element],attached_y[element],attached_z[element]
			local offrx,offry,offrz = attached_rx[element],attached_ry[element],attached_rz[element]
			local objx = x+offx*xx+offy*yx+offz*zx
			local objy = y+offx*xy+offy*yy+offz*zy
			local objz = z+offx*xz+offy*yz+offz*zz
			local rxx,rxy,rxz,ryx,ryy,ryz,rzx,rzy,rzz = getMatrixFromEulerAngles(offrx,offry,offrz)
			
			local txx = rxx*xx+rxy*yx+rxz*zx
			local txy = rxx*xy+rxy*yy+rxz*zy
			local txz = rxx*xz+rxy*yz+rxz*zz
			local tyx = ryx*xx+ryy*yx+ryz*zx
			local tyy = ryx*xy+ryy*yy+ryz*zy
			local tyz = ryx*xz+ryy*yz+ryz*zz
			local tzx = rzx*xx+rzy*yx+rzz*zx
			local tzy = rzx*xy+rzy*yy+rzz*zy
			local tzz = rzx*xz+rzy*yz+rzz*zz
			offrx,offry,offrz = getEulerAnglesFromMatrix(txx,txy,txz,tyx,tyy,tyz,tzx,tzy,tzz)
			
		--	setElementPosition(element,objx,objy,objz)
		--	setElementRotation(element,offrx,offry,offrz,"ZXY")
		else
			setElementPosition(element,getElementPosition(ped))
		end
	end
end
addEventHandler("onClientPreRender",root,putAttachedElementsOnBones)

