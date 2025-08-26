{ deviceType, pkgs, ... }:
{


  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }      
    ];


  };
  programs.swaylock = { 
    package = pkgs.swaylock-effects;
    enable = true; 

  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''    
      /* -- Global rules -- */
      * {
      border: none;
      font-family: "JetbrainsMono Nerd Font";
      font-size: 15px;
      min-height: 10px;
      }

      window#waybar {
      background: rgba(34, 36, 54, 0.6);
      }

      window#waybar.hidden {
      opacity: 0.2;
      }

      /* - Genera rules for visible modules -- */
#custom-archicon,
#clock,
#cpu,
#memory,
#disk,
#temperature,
#idle_inhibitor,
#pulseaudio,
#pulseaudio_slider,
#battery
#network,
#language {
      color: #161320;
      margin-top: 6px;
      margin-bottom: 6px;
      padding-left: 10px;
      padding-right: 10px;
      transition: none;
      }

      /* Separation to the left */
#cpu,
#idle_inhibitor {
      margin-left: 5px;
      border-top-left-radius: 10px;
      border-bottom-left-radius: 10px;
      }

      /* Separation to the rigth */
#clock,
#temperature,
#language {
      margin-right: 5px;
      border-top-right-radius: 10px;
      border-bottom-right-radius: 10px;
      }

      /* -- Specific styles -- */

      /* Modules left */
#custom-archicon {
      font-size: 20px;
      color: #89B4FA;
      background: #161320;
      padding-right: 17px;
      }

#clock {
      background: #ABE9B3;
      }

#battery  {
      background: #FAF0E6;
     margin-left: 5px;
      border-top-left-radius: 10px;
      border-bottom-left-radius: 10px;

      }

#cpu {
      background: #96CDFB;
      }


#memory {
      background: #DDB6F2;
      }

#disk {
      background: #F5C2E7;
      }

#temperature {
      background: #F8BD96;
      }

      /* Modules center */
#workspaces {
      background: rgba(0, 0, 0, 0.5);
      border-radius: 10px;
      margin: 6px 5px;
      padding: 0px 6px;
      }

#workspaces button {
      color: #B5E8E0;
      background: transparent;
      padding: 4px 4px;
      transition: color 0.3s ease, text-shadow 0.3s ease, transform 0.3s ease;
      }

#workspaces button.occupied {
      color: #A6E3A1;
      }

#workspaces button.active {
      color: #89B4FA;
      text-shadow: 0 0 4px #ABE9B3;
      }

#workspaces button:hover {
      color: #89B4FA;
      }

#workspaces button.active:hover {}

      /* Modules right */
#taskbar {
      background: transparent;
      border-radius: 10px;
      padding: 0px 5px;
      margin: 6px 5px;
      }

#taskbar button {
      padding: 0px 5px;
      margin: 0px 3px;
      border-radius: 6px;
      transition: background 0.3s ease;
      }

#taskbar button.active {
      background: rgba(34, 36, 54, 0.5);
      }

#taskbar button:hover {
      background: rgba(34, 36, 54, 0.5);
      }

#idle_inhibitor {
      background: #B5E8E0;
      padding-right: 15px;
      }

#pulseaudio {
      color: #1A1826;
      background: #F5E0DC;
      }

#pulseaudio_slider {
      color: #1A1826;
      background: #E8A2AF;
      }

#network {
      background: #CBA6F7;
      padding-right: 13px;
      }

#language {
      background: #A6E3A1;
      padding-right: 15px;
      }

      /* === Optional animation === */
      @keyframes blink {
      to {
      background-color: #BF616A;
      color: #B5E8E0;
      }
      }

    '';


    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };
      modules-center = [ "hyprland/window" ];
      modules-left = [ "hyprland/workspaces" "hyprland/mode" "pulseaudio"
      "battery"
    ];
    modules-right = [
      "network"
      "cpu"
      "memory"
      "temperature"
      "clock"
      "tray"
    ];
    battery = {
      format = "{capacity}% {icon}";
      format-alt = "{time} {icon}";
      format-charging = "{capacity}% ";
      format-icons = [ "" "" "" "" "" ];
      format-plugged = "{capacity}% ";
      states = {
        critical = 15;
        warning = 30;
      };
    };
    clock = {
      format-alt = "{:%Y-%m-%d}";
      tooltip-format = "{:%Y-%m-%d | %H:%M}";
    };
    cpu = {
      format = "{usage}% ";
      tooltip = false;
    };
    memory = { format = "{}% "; };
    network = {
      interval = 1;
      format-alt = "{ifname}: {ipaddr}/{cidr}";
      format-disconnected = "Disconnected ⚠";
      format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
      format-linked = "{ifname} (No IP) ";
      format-wifi = "{essid} ({signalStrength}%) ";
    };
    pulseaudio = {
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-icons = {
        car = "";
        default = [ "" "" "" ];
        handsfree = "";
        headphones = "";
        headset = "";
        phone = "";
        portable = "";
      };
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      on-click = "pavucontrol";
    };
    "sway/mode" = { format = ''<span style="italic">{}</span>''; };
    temperature = {
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = [ "" "" "" ];
    };
  }];
};




}
