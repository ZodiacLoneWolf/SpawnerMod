print("[SpawnerMod] Loaded.")

local UEHelpers = require("UEHelpers")


RegisterKeyBind(Key.DEL, function()
    print("[SpawnerMod] Toggle requested.")

    local pc = UEHelpers:GetPlayerController()
    if not pc then
        print("No PlayerController found.")
        return
    end

    local widgetClass = StaticFindObject("/Game/UI/ItemSpawnerMenu/ItemSpawnerMenu.ItemSpawnerMenu_C")
    if not widgetClass then
        print("ItemSpawnerMenu_C not found.")
        return
    end

    local world = pc:GetWorld()
    if not world then
        print("No valid world context.")
        return
    end

    local spawnerWidget = StaticConstructObject(widgetClass, world)
    if not spawnerWidget then
        print("Failed to create widget instance.")
        return
    end

    if spawnerWidget.Construct then
        spawnerWidget:Construct()
    end

    spawnerWidget:SetVisibility(0)
    spawnerWidget:AddToViewport(0)

    pc.bShowMouseCursor = true

    print("[SpawnerMod] Spawner menu opened with cursor enabled.")
end)

-- Viewport Refresh
RegisterKeyBind(Key.END, function()
    print("[SpawnerMod] Attempting viewport refresh hack.")

    local pc = UEHelpers:GetPlayerController()
    if not pc then
        print("No PlayerController found for refresh.")
        return
    end

    local dummyWidgetClass = StaticFindObject("/Game/UI/ItemSpawnerMenu/ItemSpawnerMenu.ItemSpawnerMenu_C")
    if not dummyWidgetClass then
        print("Dummy widget class not found.")
        return
    end

    local world = pc:GetWorld()
    if not world then
        print("No valid world context for refresh.")
        return
    end

    local dummyWidget = StaticConstructObject(dummyWidgetClass, world)
    if not dummyWidget then
        print("Failed to create dummy widget.")
        return
    end

    if dummyWidget.Construct then
        dummyWidget:Construct()
    end

    dummyWidget:SetVisibility(1)
    dummyWidget:AddToViewport(0)
    dummyWidget:RemoveFromParent()

    pc.bShowMouseCursor = false

    print("[SpawnerMod] Viewport refresh completed, mouse cursor hidden.")

    -- Additional Jury Rigging Attempts To Clean
    print("[SpawnerMod] Attempting GameViewportClient cleanup...")

    local viewportClient = FindObject("GameViewportClient", "GameEngine.GameViewport")
    if viewportClient then
        print("[SpawnerMod] Found GameViewportClient. Attempting to clear widgets...")
        
        if viewportClient.RemoveAllViewportWidgets then
            viewportClient:RemoveAllViewportWidgets()
            print("[SpawnerMod] Cleared all viewport widgets successfully.")
        else
            print("[SpawnerMod] RemoveAllViewportWidgets method not available.")
        end
    else
        print("[SpawnerMod] GameViewportClient not found or inaccessible.")
    end
end)
