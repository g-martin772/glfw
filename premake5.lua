project "glfw"
        kind "StaticLib"
        staticruntime "off"
        language "C"

        targetdir ("%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")
        objdir ("%{wks.location}/obj/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")

        files {
            "include/GLFW/glfw3.h",
            "include/GLFW/glfw3native.h",
            "src/glfw_config.h",
            "src/context.c",
            "src/init.c",
            "src/input.c",
            "src/monitor.c",
            "src/vulkan.c",
            "src/window.c",
            "src/platform.c",
            "src/null_init.c",
            "src/null_monitor.c",
            "src/null_joystick.c",
            "src/null_window.c"
        }

        includedirs {
            "include/GLFW"
        }
    
        filter "system:windows"
            systemversion "latest"

            files {
                "src/win32_init.c",
                "src/win32_joystick.c",
                "src/win32_monitor.c",
                "src/win32_time.c",
                "src/win32_thread.c",
                "src/win32_module.c",
                "src/win32_window.c",
                "src/wgl_context.c",
                "src/egl_context.c",
                "src/osmesa_context.c"
            }

            defines { 
                "_GLFW_WIN32",
                "_CRT_SECURE_NO_WARNINGS"
            }
            
        filter "system:linux"
               defines {
                     "_GLFW_X11",
                     "_GLFW_HAS_XF86VM"
                   }
               
                   files {
                     "src/egl_context.h",
                     "src/egl_context.c",
                     "src/glx_context.h",
                     "src/glx_context.c",
                     "src/linux_joystick.h",
                     "src/linux_joystick.c",
                     "src/posix_time.h",
                     "src/posix_time.c",
                     "src/posix_module.c",
                     "src/posix_poll.c",
                     "src/posix_poll.h",
                     "src/x11_init.c",
                     "src/x11_platform.h",
                     "src/x11_monitor.c",
                     "src/x11_window.c",
                     "src/xkb_unicode.h",
                     "src/xkb_unicode.c",
                     "src/posix_thread.h",
                     "src/posix_thread.c",
                     "src/osmesa_context.c",
                     "src/osmesa_context.h",
                     "src/platform.h",
                     "src/internal.h"
                   }
               
                   buildoptions
                   {
                     "-fPIC"
                   }
    
        filter "configurations:Debug"
            runtime "Debug"
            symbols "On"
    
        filter "configurations:Release"
            runtime "Release"
            optimize "On"
    
        filter "configurations:Dist"
            runtime "Release"
            optimize "On"