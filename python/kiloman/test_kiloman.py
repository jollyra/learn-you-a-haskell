from kiloman import Kiloman
import unittest

class TestKiloman(unittest.TestCase):
   
    def setUp(self):
        self.km = Kiloman()

    def test_kiloman1(self):
        damageChart = ["070","500","140"]
        bossHealth = [150,150,150]
        assert 217 == self.km.leastShots(damageChart, bossHealth)

    def test_kiloman2(self):
        damageChart = ["1542", "7935", "1139", "8882"]
        bossHealth = [150, 150, 150, 150]
        assert self.km.leastShots(damageChart, bossHealth) == 205

    def test_kiloman3(self):
        damageChart = ["07", "40"]
        bossHealth = [150, 10]
        assert self.km.leastShots(damageChart, bossHealth) == 47
        
    def test_kiloman4(self):
        damageChart = ["02111111", "10711111", "11071111", "11104111","41110111", "11111031", "11111107", "11111210"]
        bossHealth = [28,28,28,28,28,28,28,28]
        assert self.km.leastShots(damageChart, bossHealth) == 91
   
if __name__ == "__main__":
    unittest.main()
