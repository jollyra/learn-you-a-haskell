/* Graph data type using list representation
 */

#include <iostream>
#include <vector>
using namespace std;

typedef enum Error {GOOD, BAD} Error;

class Graph {
    public:
        Graph() {}

        Graph(int size) {
            for(int i = 0; i < size; i++) {
                graph_.push_back(vector<int> (size, -1));
            }
        }

        ~Graph() {}

        int V() {
            int count = 0;
            for(int i = 0; i < graph_.size(); i++) {
                for(int k = 0; k < graph_.size(); k++) {
                    count++;
                }
            }
            return count;
        }

        void add_edge() {

        }

        void tostring() {

        }

    private:
        vector<vector<int> > graph_;
};

int main() {
    Graph g = Graph(3);
    cout << "size: " << g.V() << endl;
    return 0;
}
