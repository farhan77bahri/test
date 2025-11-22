local objtoremove = {4220}

for _,obj in ipairs (objtoremove) do
removeWorldModel (obj, 10000, 0, 0, 0)
end