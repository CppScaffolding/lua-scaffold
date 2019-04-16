-- scaffold geniefile for lua

lua_script = path.getabsolute(path.getdirectory(_SCRIPT))
lua_root = path.join(lua_script, "lua")

lua_includedirs = {
	path.join(lua_script, "config"),
	lua_root,
}

lua_libdirs = {}
lua_links = {}
lua_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { lua_includedirs }
	end,

	_add_defines = function()
		defines { lua_defines }
	end,

	_add_libdirs = function()
		libdirs { lua_libdirs }
	end,

	_add_external_links = function()
		links { lua_links }
	end,

	_add_self_links = function()
		links { "lua" }
	end,

	_create_projects = function()

project "lua"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		lua_includedirs,
	}

	defines {}

	files {
		path.join(lua_script, "config", "**.h"),
		path.join(lua_root, "**.h"),
		path.join(lua_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
