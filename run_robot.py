from dotenv import load_dotenv
import os
import subprocess
import sys

# lê .env na raiz
load_dotenv()

args = ["robot", "-d", "results"] + sys.argv[1:]
subprocess.run(args, check=False)
