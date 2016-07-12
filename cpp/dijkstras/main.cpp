/* Graph data type using list representation
 */

#include <iostream>
#include <vector>
using namespace std;

class Edge {
    public:
        Edge() {}
        Edge(int x, int y, int weight) {
            x_ = x;
            y_ = y;
            weight_ = weight;
        }
        int get_x() {
            return x_;
        }
        void tostring() {
            cout << "(" << x_ << "," << y_ << ") " << "weight: " << weight_ << endl;
        }
        ~Edge() {}
    private:
        int x_;
        int y_;
        int weight_;
};

class Graph {
    public:
        Graph() {}
        Graph(int size) {
            for(int i = 0; i < size; i++) {
                graph_.push_back(vector<Edge*> ());
            }
        }
        ~Graph() {}
        int V() {
            return graph_.size();
        }
        void add_edge(Edge *e) {
            int node = e->get_x();
            vector<Edge*> edges = graph_[node];
            edges.push_back(e);
        }
        void tostring() {
            // vector<vector<Edge*> >::iterator it = graph_.begin();
            // for(it; it != graph_.end(); ++it) {
            //
            // }
        }
    private:
        vector<vector<Edge*> > graph_;
};

int main() {
    Graph *g = new Graph(2);
    g->add_edge(new Edge(0, 1, 10));
    g->add_edge(new Edge(1, 2, 11));
    cout << g->V() << endl;
    return 0;
}
