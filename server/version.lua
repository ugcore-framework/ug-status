function CheckVersion()
    local updatePath = 'https://raw.githubusercontent.com/ugcore-framework/ug-status/main/version.json'
    PerformHttpRequest(updatePath, function (status, body, headers, errorData)
        local data = json.decode(body)
        local currentVersion = LoadResourceFile(GetCurrentResourceName(), 'version.json')

        if not data or not currentVersion then
            print('^7[ug-status]: ====================================')
            print('^7[ug-status]: ^1Error on getting the updates!^7')
            print('^7[ug-status]: ^1Please try updating the framework to make this working again.^7')
            print('^7[ug-status]: ^1If you updated and it\'s still not working, then maybe it\'s an API problem, and you must wait.^7')
	        print('^7[ug-status]: ====================================')
        elseif type(currentVersion) ~= 'number' or type(data.Version) ~= 'number' then
            print('^7[ug-status]: ====================================')
            print('^7[ug-status]: ^1Detected Broked Version Checker!^7')
            print('^7[ug-status]: ^1Your version is not a valid number.^7')
            print('^7[ug-status]: ^1Please try updating the framework to make this working again.^7')
            print('^7[ug-status]: ====================================')
        elseif tonumber(currentVersion) > tonumber(data.Version) then
            print('^7[ug-status]: ====================================')
            print('^7[ug-status]: ^1Detected Broked Version Checker!^7')
            print('^7[ug-status]: ^1Your version is greater than the most recently updated version.^7')
            print('^7[ug-status]: ^1Please try updating the framework to make this working again.^7')
	        print('^7[ug-status]: ====================================')
        elseif currentVersion ~= data.Version and tonumber(currentVersion) < tonumber(data.Version) then
            print('^7[ug-status]: ====================================')
            print('^7[ug-status]: ^3New Update Found!^7')
            print('^7[ug-status]: ^3Your Version: ^1' .. currentVersion .. '^7')
            print('^7[ug-status]: ^3New Version: ^2' .. data.Version .. '^7')
            print('^7[ug-status]: ^3Changelogs: ^2' .. data.Changelogs .. '^7')
            print('^7[ug-status]: ')
            print('^7[ug-status]: ^3Update here:')
            print('^7[ug-status]: ^3https://github.com/ugcore-framework/ug-status/releases')
	        print('^7[ug-status]: ====================================')
        end
    end, 'GET')
end

MySQL.ready(function ()
    Wait(2500)
    CheckVersion()
end)