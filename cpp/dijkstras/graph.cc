/* Graph data type using list representation
 */

#include <iostream>
#include <vector>
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

        int add_edge(int x, int y, int val) {
            if (out_of_range_(x, y)) { return BAD; }
            graph_[x][y] = val;
            return GOOD;
        }

        int get_edge(const int x, const int y, int &edge) {
            if (out_of_range_(x, y)) { return BAD; }
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

        int out_of_range_(int x, int y) {
            int val = 1;
            if (x < 0 || x >= size_) {
                val =  0;
            }
            if (y < 0 || y >= size_) {
                val =  0;
            }
            return val;
        }

    private:
        vector<vector<int> > graph_;
        int size_;
};

int main() {
    Graph g = Graph(3);
    cout << "size: " << g.V() << endl;

    g.add_edge(0, 1, 10);
    g.add_edge(1, 2, 12);

    g.to_string();
    return 0;
}
