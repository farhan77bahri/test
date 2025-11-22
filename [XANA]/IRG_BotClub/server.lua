npc = createPed(246, 2425.1403808594, -1207.8413085938, 25.951675415039)
setTimer(setPedAnimation,3000,0,npc, "STRIP", "STR_C1",-1,true,true,true,false)
setElementFrozen(npc, true)
setPedRotation(npc, 0)


npc2 = createPed(152, 2438.5007324219, -1192.6143798828, 25.896810531616)
setTimer(setPedAnimation,3000,0,npc2, "STRIP", "STR_Loop_A",-1,true,true,true,false)
setElementFrozen(npc2, true)
setPedRotation(npc2, 141)


npc3 = createPed(256, 2437.9118652344, -1215.2993164063, 25.545425415039)
setTimer(setPedAnimation,3000,0,npc3, "STRIP", "STR_Loop_A",-1,true,true,true,false)
setElementFrozen(npc3, true)
setPedRotation(npc3, 30)


npc4 = createPed(87, 2437.4797363281, -1201.2883300781, 25.545425415039)
setTimer(setPedAnimation,4000,0,npc4, "STRIP", "STR_C2",-1,true,true,true,false)
setElementFrozen(npc4, true)
setPedRotation(npc4, 152)

--2431.6723632813, -1229.1103515625, 25.587043762207
conner = createPed(100, 2431.6723632813, -1229.1103515625, 25.587043762207)
setTimer(setPedAnimation,4000,0,conner, "dancing", "dance_loop",-1,true,true,true,false)
setElementFrozen(conner, true)
setElementData(conner, "Ped:Name", "Dj Conner")
setPedRotation(conner, 96)
