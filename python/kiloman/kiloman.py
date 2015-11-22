import heapq
import pdb


class Kiloman():

    def leastShots(self, damageChart, bossHealth):
        graph = self._initMatrix(damageChart, bossHealth)
        pq = []  # Priority queue for Djistra's

        # Set initial state.
        for i in range(0, len(bossHealth)):
            heapq.heappush(pq, (bossHealth[i], i, str(i)))

        while len(pq) > 0:
            node = heapq.heappop(pq)
            cost, index, path = node[0], node[1], node[2]
            if len(path) == len(bossHealth):
                return cost
            for i in range(0, len(bossHealth)):
                if graph[index][i] != -1 and str(i) not in path:
                    heapq.heappush(pq, (cost + graph[index][i], i, path+str(i)))

    def _initMatrix(self, damageChart, bossHealth):
        """ Returns an initialized 2d array."""
        # Create an uninitialized 2d array.
        g = []
        self.nrows = len(damageChart)
        self.ncols = len(bossHealth)
        i = 0
        while i < self.nrows:
            g.append([])
            i += 1

        # Fill out 2d array with values.
        for row in range(0, self.nrows):
            for col in range(0, self.ncols):
                if row == col:
                    g[row].append(-1)
                elif int(damageChart[row][col]) == 0:
                    g[row].append(-1)
                else:          
                    hp = int(bossHealth[col])
                    dmg = int(damageChart[row][col])
                    hits = hp/dmg
                    g[row].append(hits)
        return g
        

if __name__ == "__main__":
    k = Kiloman()
    damageChart = ["070","500","140"]
    bossHealth = [150,150,150]
    print k.leastShots(damageChart, bossHealth)
