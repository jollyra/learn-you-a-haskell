import re
import pdb


class Cyberline:

    def lastCyberword(self, cyberline):
        cyberline = re.subn(r'-', "", cyberline)
        cyberline = re.subn(r'[^A-Za-z0-9@]', " ", cyberline[0])
        cyberline = cyberline[0].rstrip()
        groups = re.split(" ", cyberline)
        return groups[-1]


if __name__ == "__main__":
    c = Cyberline()
    cyberline = "Zowie: This is a line of##cyber-poetry## !"
    print c.lastCyberword(cyberline)
