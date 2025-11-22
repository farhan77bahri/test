function displayMainPlate()
  guiCreateStaticImage(0.68, 0, 0.32, 0.08333, 'url.png', true, nil)
  NavmanPlate = guiCreateStaticImage(0, 0.751666666666, 0.22125, 0.248333333333, 'radar.png', true, nil)
  guiMoveToBack( NavmanPlate )
  
end

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),displayMainPlate)