import cyberline
import unittest

class test_cyberline(unittest.TestCase):

    def setUp(self):
        self.cl = cyberline.Cyberline()

    def test_poem1(self):
        s = "Zowie: This is a line of##cyber-poetry## !"
        assert self.cl.lastCyberword(s) == "cyberpoetry"

    def test_poem2(self):
        s = "2-b|!2-b -- ?"
        assert self.cl.lastCyberword(s) == "2b"

    def test_poem3(self):
        s = "if then{}; elseif schmelshif();"
        assert self.cl.lastCyberword(s) == "schmelshif"

    def test_poem3(self):
        s = "~y?"
        assert self.cl.lastCyberword(s) == "y"

    def test_poem4(self):
        s = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        assert self.cl.lastCyberword(s) == "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"


if __name__ == "__main__":
    unittest.main()
