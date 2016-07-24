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

        void add_edge() {

        }

        void tostring() {

        }

    private:
        vector<vector<int> > graph_;
        int size_;
};

int main() {
    Graph g = Graph(3);
    cout << "size: " << g.V() << endl;
    return 0;
}
