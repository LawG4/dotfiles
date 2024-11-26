import os 
import shutil
import platform 
import pathlib
import subprocess

from typing import Optional
from datetime import datetime

def main() -> int:

    # Print the installers root
    inst = Installer()
    print("Installer detected these possible choices for install roots")
    print("\t- XDG_CONFIG_HOME : {}".format(inst.xdg_dir))
    print("\t- HOME            : {}".format(inst.home_dir))
    print("\t- LOCALAPPDATA    : {}".format(inst.app_local))
    print("Selecting \"{}\"\n\n".format(inst.inst_root))
    inst.validate_init_options()

    
    inst.install_neovim()
    return 0

def fatal_error(msg: str):
    print("Fatal error! : " + msg)
    exit(-1)

# Try and get the platform root
from enum import Enum
class PlatformTarget(Enum):
    Unknown = 0
    Win32 = 1
    Linux = 2
    Apple = 3

    def as_str(self) -> str:
        match self:
            case PlatformTarget.Win32:
                return "Windows"
            case PlatformTarget.Linux:
                return "Linux"
        return "Unknown"

    def fetch() -> int:
        match os.name:
            case "nt":
                return PlatformTarget.Win32
            case "Linux":
                return PlatformTarget.Linux
            case "posix":
                system_name = platform.system()
                if(system_name == "Linux"):
                    return PlatformTarget.Linux
                elif "MSYS_NT" in system_name:
                    return PlatformTarget.Win32
        print("Unknown (Os Name, Platform System) = ( \"{}\", \"{}\" )".format(os.name, platform.system()))
        return PlatformTarget.Unknown
             
class Installer:

    # Initialize the structure
    def __init__(self):
        self.target = PlatformTarget(PlatformTarget.fetch() )
        
        # Common places configs look 
        self.home_dir = os.environ.get('HOME')
        self.xdg_dir = os.environ.get('XDG_CONFIG_HOME') 
        self.app_local = os.environ.get('LOCALAPPDATA')
        self.inst_root = self.fetch_install_root() 
        self.repo_root = pathlib.Path(__file__).parent
        self.backup_dir = None

    # Calls exit on the initialization options being no good
    def validate_init_options(self):
        if self.inst_root is None:
            fatal_error("No selected install root")

        if not self.inst_root.exists():
            fatal_error("Selected install path \"{}\" doesn't exist".format(self.inst_root))

    def copy_backup(self, source: pathlib.Path):
        # Ensure the source path exits
        if not source.exists():
            fatal_error("Source {} doesn't exist for backup".format(source))
        
        # Ensure there is a backup folder 
        if self.backup_dir is None:
            backup_root = self.repo_root.joinpath("backups")
            backup_root.mkdir(exist_ok=True)
            curr_time = datetime.now().strftime("%Y_%m_%d__%H_%M_%S")
            self.backup_dir = backup_root.joinpath(curr_time)
        self.backup_dir.mkdir(exist_ok=True)

        # Now make the copy 
        shutil.copytree(source, self.backup_dir.joinpath("neovim"))


    # Only called during startup     
    def fetch_install_root(self) -> Optional[pathlib.Path]:
        if self.xdg_dir is not None:
            return pathlib.Path(self.xdg_dir)
        elif self.target == PlatformTarget.Win32 and self.app_local is not None :
            return pathlib.Path(self.app_local)
        
        if self.home_dir is not None:
            return pathlib.Path(self.home_dir)
        return None
        
    def install_neovim(self):
        nvim_inst = self.inst_root.joinpath("nvim")
        nvim_src = self.repo_root.joinpath("neovim")
        if nvim_inst.exists():
            print("Nvim config already exists, in {}".format(nvim_inst))
            self.copy_backup(nvim_inst)
            shutil.rmtree(nvim_inst)
        shutil.copytree(nvim_src, nvim_inst)
        
        # I use vimspector in my config and I don't want to make vim check 
        # on every launch so I just do it here 
        subprocess.check_call(["pip3", "install", "pynvim"])


        pass
    



# Stupid python entry point 
if __name__ == '__main__':

    
    exit( main() )
    # Check if user want's to overwrite their config
    print("Currently only installing neovim config")
    neovim_dst = get_default_config_location() + "/nvim"
    neovim_src = os.path.dirname(__file__) + "/neovim"

    # Check with the user if this is okay?
    if os.path.exists(neovim_dst):
        print("Neovim config detected in \"{}\"".format(neovim_dst))
        cont = input("Do you want to continue? Take a backup first y/n\n").capitalize()
        if cont != "Y":
            print("Cancelling")
            exit(0)
        print("Removing existing config")
        shutil.rmtree(neovim_dst)
    print("Installing neovim config into \"{}\"".format(neovim_dst))   

    # Actually perform the copy
    try:
        shutil.copytree(neovim_src, neovim_dst)
    except :
        print("Failed when copying")
        exit(-1)
    print("Success copying neovim config")
     
    
