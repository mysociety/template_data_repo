"""
Adds top level to path to make general references easier
"""

import sys
import os
from pathlib import Path

if ".." not in sys.path:
    sys.path.insert(0, "..")
    os.chdir(Path(os.getcwd()).parent)
