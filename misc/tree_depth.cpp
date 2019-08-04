// C++ program to find height of tree 
#include <bits/stdc++.h> 
using namespace std; 


/* A binary tree node has data, pointer to left child  
and a pointer to right child */
class node
{
    public:
    int data;
    node* left;
    node* right;
};
node* newNode(int data)
{
    node* Node = new node();
    Node->data = data;
    Node->left = NULL;
    Node->right = NULL;

    return(Node);
}
// Driver code
int main()
{
}
