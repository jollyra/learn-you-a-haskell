/* Graph data type using list representation
 */

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

typedef enum Error {GOOD, BAD} Error;

class Graph {
    public:
        Graph(int size) {
            this->size_ = size;
            for(int i = 0; i < size; i++) {
                graph_.push_back(vector<int> (size, -1));
            }
        }

        ~Graph() {}

        int V() {
            return size_;
        }

        int E() {
            int count = 0;
            for(int i = 0; i < graph_.size(); i++) {
                for(int k = 0; k < graph_.size(); k++) {
                    if(graph_[i][k] > 0) {
                        count++;
                    }
                }
            }
            return count;
        }

        int add_edge(int x, int y, int val) {
            if(out_of_range_(x, y)) { return BAD; }
            graph_[x][y] = val;
            return GOOD;
        }

        int get_edge(const int x, const int y, int &edge) {
            if(out_of_range_(x, y)) { return BAD; }
            edge = graph_[x][y];
            return GOOD;
        }

        void to_string() {
            cout << "graph matrix:" << endl;
            for(int i = 0; i < graph_.size(); i++) {
                for(int k = 0; k < graph_.size(); k++) {
                    int edge;
                    get_edge(i, k, edge);
                    cout << edge << "\t";
                }
                cout << endl;
            }
        }

        int adjacent(int x, int y, int &ret) {
            if(out_of_range_(x, y)) { return BAD; }
            ret = 0;
            if(graph_[x][y] > 0) {
                ret = 1;
            }
            return GOOD;
        }

        int neighbours(int x, vector<int> &edges) {
            if(out_of_range_(x)) { return BAD; }
            edges = graph_[x];
            return GOOD;
        }

    private:
        vector<vector<int> > graph_;
        int size_;

        int out_of_range_(int x, int y=0) {
            int val = 0;
            if (x < 0 || x >= size_) {
                val =  1;
            }
            if (y < 0 || y >= size_) {
                val =  1;
            }
            return val;
        }
};

class ShortestPath {
    public:
        ShortestPath(Graph graph) : graph_(graph) {}

        ~ShortestPath() {}

        // Outputs the shortest path from node u to node v.
        int path(int u, int v, vector<int> &shortest_path) {
            return GOOD;
        }

        int path_cost(int u, int v, int cost) {
            return GOOD;
        }

    private:
        Graph graph_;
};

int main() {
    Graph g = Graph(4);
    cout << "nodes: " << g.V() << endl;
    cout << "edges: " << g.E() << endl;

    g.add_edge(0, 1, 1);
    g.add_edge(0, 2, 2);
    g.add_edge(1, 3, 1);
    g.add_edge(2, 3, 1);

    g.to_string();
    return 0;
}
