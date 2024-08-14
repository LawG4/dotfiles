import os 
import shutil

def get_default_config_location() -> str:
    if os.name == "nt":
        return str(os.environ['USERPROFILE']) + "/Appdata/Local"
    else:
        return str(os.environ['HOME']) + "/.config" 

# Stupid python entry point 
if __name__ == '__main__':
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
     
    
