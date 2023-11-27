import os
from sys import argv

argc = len(argv)

# features:
"""

it will have 2 commands for now, run and new,
run will just do: python main.py 
new will create a new project, it has 1 arg: name
obv it will have a help command

"""

if argc > 1:
    if argv[1] == "new":
        if argc > 2:
            directory = os.getcwd()
            project_folder = os.path.join(directory, f"{argv[2]}")
            src_folder = os.path.join(project_folder, "src")
            main_file = os.path.join(src_folder, "main.py")
            os.mkdir(project_folder)
            os.mkdir(src_folder)
            with open(main_file, "w") as file:
                file.write("print('hello world!')")
                file.close()
        else:
            print("Not enough arguments specified. Try using the help command!")

    elif argv[1] == "run":
        os.system("python main.py")

    elif argv[1] == "help":
        print("commands, new {name}: creates a ew")
    else:
        print(f"{argv[1]} is not a recognised command. Try using the help command!")
else:
    print("Not enough arguments specified. Try using the help command!")
