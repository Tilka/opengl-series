solution "02_textures"
	location("./")
	targetdir("./bin")
	configurations { "debug", "release" }
	objdir("obj/" .. os.get() .. "/")
	includedirs {"./thirdparty/stb_image"}

	project "02_textures-app"
		kind "ConsoleApp"
		language "C++"
		files { "source/**.cpp" }

		configuration "windows"
			links {"glu32", "opengl32", "gdi32", "winmm", "user32","GLEW"}

		configuration "linux"
			links {"GL","glfw","GLEW"}
		
		configuration "macosx"
			links {"GL","glfw","GLEW", "CoreFoundation.framework"}
			libdirs {"/opt/local/lib"}
			includedirs {"/opt/local/include"}
		
		configuration "haiku"
			links {"GL","glfw","GLEW"}

		configuration "freebsd"
			links {"GL","glfw","GLEW"}
		
		configuration "debug"
			defines { "DEBUG" }
			flags { "Symbols" }
			buildoptions{ "-Wall" }
			targetname "02_textures-debug"

		configuration "release"
			defines { "NDEBUG" }
			flags { "Optimize" }
			buildoptions{ "-Wall" }
			targetname "02_textures-release"
