
9
10

boolean i s R o t a t i o n ( S t r i n g s i , S t r i n g
int len = s l . l e n g t h f ) ;
/* Check t h a t si and s2 are equal
if ( l e n == s2.1ength() && len > e)
/* Concatenate si and si w i t h i n
S t r i n g s l s l = si + s i ;
return i s S u b s t r l n g ( s l s l , s2);
>
return false;
>

s2) {
l e n g t h and not empty */
{
new b u f f e r */

The runtime of this varies based on the runtime of i s S u b s t r i n g . But if you assume that i s S u b s t r i n g
runs in 0 ( A + B ) time (on strings of length A and B), then the runtime of i s R o t at i o n isO(N).

C r a c k i n g T h e C o d i n g l n t e r v i e w . c o m | 6 t h E d i t i o n 199

2
Solutions to Linked Lists

2.7

Remove Dups: Write code to remove duplicates from an unsorted linked list.
FOLLOW UP
How would you solve this problem if a temporary buffer is not allowed?
pg94

SOLUTION
In order to remove duplicates from a linked list, we need to be able to track duplicates. A simple hash table
will work well here.
In the below solution, we simply iterate through the linked list, adding each element to a hash table. When
we discover a duplicate element, we remove the element and continue iterating. We can do this all in one
pass since we are using a linked list.
1
2
3
4
5
6
7
8
9
10
11
12
13

void deleteDups(LinkedListNode n) {
HashSetcInteger> set = new HashSet<Integer>();
LinkedListNode previous = n u l l ;
w h i l e (n U n u l l ) {
if ( s e t . c o n t a i n s f n . d a t a ) ) {
previous.next = n.next;
} else {
set.add(n.data);
previous = n;
}
n = n.next;
>
}

The above solution takes 0 ( N ) time, where N is the number of elements in the linked list.
Follow Up: No Buffer Allowed
!f we don't have a buffer, we can iterate with two pointers: c u r r e n t which iterates through the linked list,
and r u n n e r which checks all subsequent nodes for duplicates.
1
2
3
4
5
6
7

void deleteDups(LinkedListNode head) {
LinkedListNode c u r r e n t = head;
w h i l e ( c u r r e n t 1= n u l l ) {
/* Remove a l l f u t u r e nodes t h a t have t h e same value */
LinkedListNode runner = c u r r e n t ;
w h i l e ( r u n n e r . n e x t != n u l l ) {
if ( r u n n e r . n e x t . d a t a == c u r r e n t . d a t a ) {

186

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
8
9
10
11
12
13
14
15

runner.next = r u n n e r . n e x t . n e x t ;
> else {
runner = r u n n e r . n e x t ;
>
}
current • current.next;
>
}

This code runs in 0 ( 1 ) space, but 0 ( N 2 ) time.

2.2

Return Kth to Last: implement an algorithm to find the kth to last element of a singly linked list.
pg 223

SOLUTION
We will approach this problem both recursively and non-recursively. Remember that recursive solutions are
often cleaner but less optimal. For example, in this problem, the recursive implementation is about half the
length of the iterative solution but also takes 0 { n ) space, where n is the number of elements in the linked
list.
Note that for this solution, we have defined k such that passing in k = 1 would return the last element, k
= 2 would return to the second to last element, and so on. It is equally acceptable to define k such that k
= 0 would return the lastelement.
Solution #1; If linked list size is known
If the size of the linked list is known, then the kth to last element is the ( l e n g t h - k ) t h element. We can
just iterate through the linked list to find this element. Because this solution is so trivial, we can almost be
sure that this is not what the interviewer intended.
Solution #2: Recursive
This algorithm recurses through the linked list. When it hits the end, the method passes back a counter set
to 0. Each parent call adds 1 to this counter. When the counter equals k, we know we have reached the kth
to last element of the linked list.
Implementing this is short and sweet—provided we have a way of "passing back" an integer value through
the stack. Unfortunately, we can't pass back a node and a counter using normal return statements. So how
do we handle this?
Approach A: Don't Return the Element.
One way to do this is to change the problem to simply printing the kth to last element. Then, we can pass
back the value of the counter simply through return values.
1
2
3

i n t printKthToLast(LlnkedListNode head, i n t k) {
if (head == n u l l ) {
r e t u r n 0;

4
6
8
9
10

}

>
i n t index = p r i n t K t h T o L a s t ( h e a d . n e x t j k) + 1;
if (index == k) {
S y s t e m . o u t . p r i n t l n ( k + " t h to l a s t node is " + head.data);
}
r e t u r n index;

C r a c k i n g T h e C o d i n g l n t e r v i e w . c o m | 6th E d i t i o n

22 3

Solutions to Chapter 2 | Linked Lists
Of course, this is only a valid solution if the interviewer says it is valid
Approach B: Use C++.
A second way to solve this is to use C++ and to pass values by reference. This allows us to return the node
value, but also update the counter by passing a pointer to it.
1
node* nthloLast(node* head, i n t k, i n t S i) {
2
if (head == NULL) {
3
r e t u r n NULL;
4
>
5
node* nd = nthToLast(head->next, k, i ) ;
6
i = i + 1;
7
i f ( i == k) {
8
r e t u r n head;
9
>
10
r e t u r n nd;
11 >
12
13 node* nthToLast(node* head, i n t k) {
14
i n t i = 0;
15
r e t u r n nthToLast(head, k, i ) ;
16 >
Approach C: Create a Wrapper Class.
We described earlier that the issue was that we couldn't simultaneously return a counter and an index. If
we wrap the c o u n t e r value with simple class (or even a single element array), we can mimic passing by
reference.
1
class Index {
2
p u b l i c i n t value = 0;
3
}
4
5
LinkedListNode kthToLast(LinkedListNode head, i n t k) {
6
Index idx = new I n d e x Q ;
7
r e t u r n kthToLast(head, k, i d x ) ;
8
>
9
10 LinkedListNode kthToLast(LinkedListNode head, i n t k, Index i d x ) {
11
if (head == n u l l ) {
12
return n u l l ;
13
>
14
LinkedListNode node = kthToLast(head.next, k, i d x ) ;
15
i d x . v a l u e = i d x . v a l u e + 1;
16
if ( i d x . v a l u e == k) {
17
r e t u r n head;
18
>
19
r e t u r n node;
20 )
Each of these recursive solutions takes 0 ( n ) space due to the recursive calls.
There are a number of other solutions that we haven't addressed. We could store the counter in a static variable. Or, we could create a class that stores both the node and the counter, and return an instance of that
class. Regardless of which solution we pick, we need a way to update both the node and the counter in a
way that all levels of the recursive stack will see.

Î26

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
Solution #3: Iterative
A more optimal, but less straightforward, solutionis to implement this iteratively. We can use two pointers,
pi and p2. We place them k nodes apart in the linked list by putting p2 at the beginning and moving pi
k nodes into the list. Then, when we move them at the same pace, pi will hit the end of the linked list after
LENGTH - k steps. At that point, p2 will be LENGTH - k nodes into the list, or k nodes from the end.
The code below implements this algorithm.
1
2
3
4
5
6
7
8
9

LinkedListNode nthToLast(LinkedListNode head, i n t k) {
LinkedListNode pi = head;
LinkedListNode p2 = head;
/* Move pi k nodes i n t o the l i s t . * /
f o r ( i n t i = 0 ; i < k ; i++) {
if ( p i == n u l l ) r e t u r n n u l l ; // Out of bounds
pi = p i . n e x t ;
>

10
11
12
13
14
15

/* Move them at the same pace. When pi h i t s the end, p2 w i l l be at t h e r i g h t
* element. */
w h i l e ( p i 1= n u l l ) {
pi = p i . n e x t ;
p2 * p 2 , n e x t ;

16

>

17
18

r e t u r n p2;
}

ThisalgorithmtakesO(n) t i m e a n d O ( l ) space.

2.3

Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but
the first and last node, not necessarily the exact middle) of a singly linked list, given only access to
that node.
EXAMPLE
Input: the node c from the linked list a - > b - > c - > d - > e - > f
Result: nothing is returned, but the new linked list looks like a- > b - > d - > e - > f
pg 94

SOLUTION
In this problem, you are not given access to the head of the linked list. You only have access to that node.
The solution is simply to copy the data from the next node over to the current node, and then to delete the
next node.
The code below implements this algorithm.
1
2
3
4
5
6
8
9

boolean deleteNode(LinkedListNode n) {
if (n == n u l l |{ n.next == n u l l ) {
    return false; // Failure
}
  LinkedListNode next = n . n e x t ;
  n.data = next.data;
  n.next = n e x t . n e x t ;
  return true;
>

CrackingTheCodinglnterview.com | 6 t h Edition

22 3

Solutions to Chapter 2 | Linked Lists
Note that this problem cannot be solved if the node to be deleted is the last node in the linked list. That's
okay—your interviewer wants you to point that out, and to discuss how to handle this case. You could, for
example, consider marking the node as dummy.

2.4

Partition; Write code to partition a linked list around a value x, such that all nodes less than x come
before all nodes greater than or equal tox. If x is contained within the list, the values of x only need
to be after the elements less than x (see below). The partition element x can appear anywhere in the
"right partition"; it does not need to appear between the left and right partitions.
EXAMPLE
input:

3 -> S -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5]

Output:

3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
pg 94

SOLUTION
If this were an array, we would need to be careful about how we shifted elements. Array shifts are very
expensive.
However, in a linked list, the situation is much easier. Rather than shifting and swapping elements, we can
actually create two different linked lists: one for elements less than x, and one for elements greater than or
equal to x.
We iterate through the linked list, inserting elements into our b e f o r e list or our a f t e r list. Once we reach
the end of the linked list and have completed this splitting, we merge the two lists.
This approach is mostly "stable" in that eiementsstay in their original order, other than the necessary movement around the partition. The code below implements this approach.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23

/ • Pass i n t h e head o f the l i n k e d l i s t and t h e value t o p a r t i t i o n around * /
  LinkedListNode partition(LinkedListNod end,int x) 
  LinkedListNode beforeStart = null;
  LinkedListNode beforeEnd = null
  LinkedListNode afterStart = null;
  LinkedListNode afterEnd = null;
  /* Partition l i s t */
  while (node != null) {
    LinkedListNode next = node.next;
      node.next = n u l l ;
      if (node.data < x) {
/* I n s e r t node i n t o end of before l i s t */
  if (beforeStart == null) {
    beforeStart = node;
    beforeEnd = beforeStart;
  } else {
  beforeEnd.next = node;
  beforeEnd = node;
  } else {
  if (afterStart == null ) {
    afterStart = node;
    afterEnd = afterStart;
  ) else {
  a f t e r E n d . n e x t = node;
  afterEnd = node;
  node = n e x t ;
  if ( b e f o r e S t a r t == n u l l ) {
    return afterStart;
  / * Merge before l i s t and a f t e r l i s t * /
  beforeEnd.next = a f t e r S t a r t ;
  return beforeStart;
}

If it bugs you to keep around four different variables for tracking two linked lists, you're not alone. We can
make this code a bit shorter.
If we don't care about making the elements of the list "stable" (which there's no obligation to, since the
interviewer hasn't specified that), then we can instead rearrange the elements by growing the list at the
head and tail.
in this approach, we start a "new" list (using the existing nodes). Elements bigger than the pivot element are
put at the tail and elements smaller are put at the head. Each time we insert an element, we update either
the head or tail.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21

LinkedListNode p a r t i t i o n ( L i n k e d L i s t N o d e node, i n t x) {
LinkedListNode head = node;
LinkedListNode t a i l = node;
w h i l e (node != n u l l ) {
LinkedListNode next = node.next;
if (node.data < x) {
    node.next = head;
    head = node;
  } else {
    tail.next = node;
    tail = node;
  }
  node = next ;
}
tail.next = null;
// The head has changed, so we need to r e t u r n it to t h e user.
r e t u r n head;

There are many equally optimal solutions to this problem, if you came up with a different one, that's okay!

CrackingTheCodinglnterview.com | 6th Edition

22 3

Solutions to Chapter 2 | Linked Lists
2.5

Sum Lists: You have two numbers represented by a linked list, where each node contains a single
digit. The digits are stored in reverse order, such that the 1's digit is at the head of the iist. Write a
function that adds the two numbers and returns the sum as a linked list.
EXAMPLE
input; ( 7 - > 1 -> 6) + (S -> 9 -> 2). That is, 617 + 295.
Output; 2 -> 1 -> 9.That is, 912.
FOLLOW UP
Suppose the digits are stored in forward order. Repeat the above problem.
Input (6 -> 1 -> 7) + (2 -> 9 -> S). That is, 617 + 295.
Output: 9 -> 1 -> 2.That is, 912.
Pg95

SOLUTION
It's useful to remember in this problem how exactly addition works. Imagine the problem:
6 17
+ 2 9 S
First, we add 7 and 5 to get 12. The digit 2 becomes the last digit of the number, and 1 gets carried over to
the next step. Second, we add 1,1, and 9 to get 11.The 1 becomes the second digit, and the other 1 gets
carried over the final step. Third and finally, we add 1,6 and 2 to get 9. So, our value becomes 912.
We can mimic this process recursively by adding node by node, carrying over any "excess" data to the next
node. Let's walk through this for the below linked list:
7 - > 1 -> 6
+ 5 -> 9 - > 2
We do the following:
1. We add 7 and 5 first, getting a result of 12.2 becomes the first node in our linked list, and we "carry" the
1 to the next sum.
L i s t : 2 -> ?
2. We then add 1 and 9, as well as the "carry," getting a result of 11. 1 becomes the second element of our
linked list, and we carry the 1 to the next sum.
L i s t : 2 -> 1 -> ?
3. Finally, we add 6, 2 and our "carry," to get 9. This becomes the final element of our linked list.
L i s t : 2 -> 1 -> 9.
The code below implements this algorithm.
1
2
3
4
5
6
7
8
9
10
11

Î26

LinkedlistNode addLists(LinkedListNode l l , LinkedListNode 12, i n t c a r r y ) {
if (11 == n u l l &S 12 == n u l l && carry == 0) {
return n u l l ;
>
LinkedListNode r e s u l t = new LinkedListNode();
i n t value = c a r r y ;
if (11 != n u l l ) {
value += 11.data;
>
if (12 1= n u l l ) {

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
12
13
14
15
16
17
18
19
20
21
22
23
24
25

value += 12.data;
>
r e s u l t . d a t a = value % 10; /* Second d i g i t of number */
/* Recurse */
if (11 != n u l l || 12 {= n u l l ) {
LinkedListNode more = a d d L i s t s ( l l == n u l l ? n u l l : 1 1 . n e x t ,
12 == n u l l ? n u l l : 1 2 . n e x t ,
value >= 10 ? l : 0 ) ;
result.setNext(more);
}
return result;
}

In implementing this code, we must be careful to handle the condition when one linked list is shorter than
another. We don't want to get a null pointer exception.
Follow Up
Part B is conceptually the same (recurse, carry the excess), but has some additional complications when it
comes to implementation:
1. One list may be shorter than the other, and we cannot handle this"on the fly"For example, suppose we
were adding (1 -> 2 - > 3 - > 4 ) a n d ( 5 - > 6 - > 7). We need to know that the 5 should be "matched" with the
2, not the 1. We can accomplish this by comparing the lengths of the lists in the beginning and padding
the shorter list with zeros.
2. In the first part, successive results were added to the tail (i.e., passed forward). This meant that the recursive call would be passed the carry, and would return the result (which is then appended to the tail). In
this case, however, results are added to the head (i.e., passed backward). The recursive call must return
the result, as before, as well as the carry. This is not terribly challenging to implement, but it is more
cumbersome. We can solve this issue by creating a wrapper class called Partial Sum.
The code below implements this algorithm.
1
c l a s s PartialSum {
2
p u b l i c LinkedListNode sum = n u l l ;
3
p u b l i c i n t c a r r y = 0;
4
}
5
6
LinkedListNode addLists(LinkedListNode 11, LinkedListNode 12) {
7
int lenl = length(ll);
8
i n t len2 = l e n g t h ( 1 2 ) ;
9
10
/* Pad the s h o r t e r l i s t w i t h zeros - see note (1) */
11
if ( l e n l < len2) {
12
11 = p a d L i s t ( l l , len2 - l e n l ) ;
13
) else {
14
12 = p a d L i s t ( 1 2 j l e n l - l e n 2 ) ;
15
}
16
17
/* Add l i s t s v
18
PartialSum sum = a d d L i s t s H e l p e r ( l l , 1 2 ) ;
19
20
{ * i f t h e r e was a c a r r y value l e f t over, i n s e r t t h i s a t t h e f r o n t o f the l i s t .
21
* Otherwise, j u s t r e t u r n the l i n k e d l i s t . * /
22
if (sum.carry == 0) {

CrackingTheCodinglnterview.com | 6 t h Edition

22 3

Solutions to Chapter 2 | Linked Lists
23
24
25
26
27
28

29
36
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66

r e t u r n sum.sum;
> else {
LinkedListNode r e s u l t = insertBefore(sum.sum,
return result;
>

sum.carry);

}

Partialsum addListsHelper(LinkedListNode 11, LinkedListNode 12) {
if (11 == n u l l S8 12 == n u l l ) {
PartialSum sum = new P a r t i a l S u m Q ;
r e t u r n sum;
}
/* Add smaller d i g i t s r e c u r s i v e l y */
PartialSum sum = a d d L i s t s H e l p e r ( I l . n e x t , 1 2 . n e x t ) ;
/* Add c a r r y to c u r r e n t data */
i n t v a l = sum.carry + 11.data + 12.data;
/ * I n s e r t sum o f c u r r e n t d i g i t s * /
LinkedListNode f u l l _ r e s u l t = insertBefore(sum.sum, v a l % 1 0 ) ;
/* Return sum so f a r , and the c a r r y value */
sum.sum = f u l l _ r e s u l t ;
sum.carry = v a l / 10;
r e t u r n sura;
)
/* Pad t h e l i s t w i t h zeros */
LinkedListNode p a d L i s t ( L i n k e d l i s t N o d e lj
LinkedListNode head = 1;
f o r ( i n t i = 0; i < padding; i++) {
head = i n s e r t B e f o r e ( h e a d , 6 ) ;
>
r e t u r n head;
>

i n t padding)

{

/ * Helper f u n c t i o n t o i n s e r t node i n the f r o n t o f a l i n k e d l i s t * /
LinkedListNode i n s e r t B e f o r e ( L i n k e d L i s t N o d e l i s t , i n t data) {
LinkedListNode node = new LinkedListNode(data);
if ( l i s t != n u l l ) {
node.next = l i s t ;
>
r e t u r n node;
}

Note how we have pulled i n s e r t B e f o r e ( ) , pad L i s t ( ) , and l e n g t h { ) (not listed) into their own
methods. This makes the code cleaner and easier to read—a wise thing to do in your interviews!

2.6

Palindrome: Implement a function to check if a linked list is a palindrome,
pg9S

SOLUTION
To approach this problem, we can picture a palindrome like 0 -> 1 -> 2 -> 1 -> 0. We know that,
since it's a palindrome, the list must be the same backwards and forwards. This leads us to our first solution.

Î26

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
Solution #1: Reverse and Compare
Our first solution is to reverse the linked list and compare the reversed list to the original list, if they're the
same, the lists are identical.
Note that when we compare the linked list to the reversed tist, we only actually need to compare the first
haifof the list. If the first half of the normal list matches the first half of the reversed list, then the second half
of the normal list must match the second half of the reversed fist.
1
2
3
4
5
6
7
8
10
11
12
13
14
15

boolean isPalindrome(LinkedListNode head) {
LinkedListNode reversed = reverseAndClone(head);
r e t u r n isEqualfhead, r e v e r s e d ) ;
}
LinkedListNode reverseAndClone(LinkedListNode node) {
LinkedListNode head = n u l l ;
w h i l e {node != n u l l ) {
LinkedListNode n = new LinkedListNode(node.data); // Clone
n . n e x t = head;
head = n;
node = node.next;
}
r e t u r n head;
>

16

17 boolean IsEqualfLinkedListNode one, LinkedListNode two) {
18
w h i l e {one 1= n u l l && two != n u l l ) {
19
if (one.data 1= two.data) {
20
return false;
21
>
22
one = one.next;
23
two = t w o . n e x t ;
24
>
25
r e t u r n one == n u l l && two =* n u l l ;
26 }
Observe that we've modularized this code into r e v e r s e and is E q u a l functions. We've also created a new
class so that we can return both the head and the tail of this method. We could have also returned a twoelement array, but that approach is less maintainable.
Solution #2; Iterative Approach
We want to detect linked listswhere the front half of the list is the reverse of the second half. How would we
do that? By reversing the front half of the list. A stack can accomplish this.
We need to push the first half of the elements onto a stack. We can do this in two different ways, depending
on whether or not we know the size of the linked list.
if we know the size of the linked list, we can iterate through the first half of the elements in a standard for
loop, pushing each element onto a stack. We must be careful, of course, to handle the case where the length
of the linked list is odd.
if we don't know the size of the linked list, we can iterate through the linked list, using the fast runner / slow
runner technique described in the beginning of the chapter. At each step in the loop, we push the data from
the slow runner onto a stack. When the fast runner hits the end of the list, the slow runner will have reached
the middle of the linked list. By this point, the stack will have all the elements from the front of the linked
list, but in reverse order.

CrackingTheCodinglnterview.com | 6th Edition

22 3

Solutions to Chapter 2 | Linked Lists
Now, we simply iterate through the rest of the linked list. At each iteration, we compare the node to the top
of the stack. If we complete the iteration without finding a difference, then the linked list is a palindrome.
1
boolean isPalindrome(LinkedListNode head) {
2
LinkedListNode f a s t = head;
3
LinkedListNode slow = head;
4
5
Stack<lntegen> stack = new 5 t a c k < I n t e g e r > ( ) ;
6
7
/* Push elements from f i r s t h a l f of l i n k e d l i s t onto stack. When f a s t runner
3
* (which is moving at 2x speed) reaches the end of the l i n k e d l i s t , then we
9
* know we're at the middle */
10
w h i l e ( f a s t 1= n u l l && f a s t . n e x t 1= n u l l ) {
11
stack,push(slow.data);
12
slow = s l o w , n e x t ;
13
fast = fast.next.next;
14
>
15
16
/* Has odd number of elements, so skip t h e middle element */
17
if ( f a s t 1= n u l l ) {
18
slow = s l o w , n e x t ;
19
>
20
21
w h i l e (slow 1= n u l l ) {
22
i n t top = stack.pop().intValue();
23
24
f* If values are d i f f e r e n t , then i t ' s not a palindrome */
25
if ( t o p 1= slow.data) (
26
return false;
27
}
28
slow = s l o w . n e x t ;
29
>
30
return true;
31 >
Solution #3: Recursive Approach
First, a word on notation: in this solution, when we use the notation node Kx, the variable K indicates the
value of the node data, and x (which is either f or b) indicates whether we are referring to the front node
with that value or the back node. For example, in the below linked list, node 2b would refer to the second
(back) node with value 2.
Now, like many linked list problems, you can approach this problem recursively. We may have some intuitive idea that we want to compare element 0 and element n - 1, element 1 and element n - 2 , element 2
and element n - 3 , and so on, until the middle element(s). For example:
0 ( 1 ( 2 ( 3 ) 2 ) 1 ) 0
In order to apply this approach, we first need to know when we've reached the middle element, as this will
form our base case. We can do this bypassing in l e n g t h - 2 for the l e n g t h each time. When the length
equals 0 or 1, we're at the center of the linked list. This is because the length is reduced by 2 each time. Once
we've recursed % times, l e n g t h will be down to 0.
1
2
3
4

recurse(Node n, i n t l e n g t h )
if ( l e n g t h == 0 || l e n g t h
r e t u r n [something]; //
)
recurse(n.next, length -

Î26

{
== 1) {
At middle
2);

Cracking the Coding Interview, 6th Edition

Solutions to Chapter 2 | Linked Lists
6
7

}

This method will form the outline of the i s P a l i n d r o m e method. The "meat" of the algorithm though is
comparing node i to node n - i to check if the linked list is a palindrome. How do we do that?
Let's examine what the call stack looks like:
1
2
3
4
5
6
7
8

v l = isPalindrome:

list = 0 ( 1 ( 2 ( 3 ) 2 ) 1 ) 0 .

length = 7

v 2 = isPalindrome: l i s t = 1 ( 2 ( 3 ) 2 ) 1 ) 0 . l e n g t h = 5
v 3 = isPalindrome: l i s t = 2 ( 3 ) 2 ) 1 ) 0 . l e n g t h = 3
v 4 = isPalindrome: l i s t = 3 ) 2 ) 1 ) 0 . length = 1
r e t u r n s v3
r e t u r n s v2
r e t u r n s vl
returns ?

In the above call stack, each call wants to check if the list is a palindrome by comparing its head node with
the corresponding node from the back of the list. That is:
•

Line 1 needs to compare node 0f with node 0b

•

Line 2 needs to compare node If with node

•

Line 3 needs to compare node 2f with node 2b

•

Line 4 needs to compare node 3 f w i t h n o d e 3b.

lb

If we rewind the stack, passing nodes back as described below, we can do just that:
•

Line4 sees that it is the middle node (since l e n g t h = 1), and passes back head. next.The value head
equals node 3, so head. n e x t is node 2b,

•

•

Line 3 compares its head, node 2 f , to r e t u r n e d _ n o d e (the value from the previous recursive call),
which is node 2b, If the values match, it passes a reference to node lb ( r e t u r n e d _ n o d e . n e x t ) up
to Sine 2.
Line 2 compares its head (node I f ) to r e t u r n e d _ n o d e (node l b ) . If the values match, it passes a
reference to node 0b (or, r e t u r n e d _ n o d e . n e x t ) up to tine 1.

•

Line 1 compares its head, node
returns true.

0 f , to r e t u r n e d j i o d e , which is node

0b. If the values match, it

To generalize, each call compares its head to r e t u r n e d _ n o d e , and then passes r e t u r n e d _ n o d e . n e x t
up the stack. In this way, every node i gets compared to node n

-

i. If at any point the values do not

match, we return f a l s e , and every call up the stack checks for that value.
But wait, you might ask, sometimes we said we'll return a b o o l e a n value, and sometimes we're returning
a node. Which is it?
It's both. We create a simple class with two members, a b o o l e a n and a node, and return an instance of
that class.
1
2
3
4

c l a s s Result {
p u b l i c LinkecfListNode node;
p u b l i c boolean r e s u l t ;
}

The example below illustrates the parameters and return values from this sample list.
1
2
3

isPalindrome:
isPalindrome:

list

= 0 ( 1 ( 2 ( 3 ( 4 ) 3 ) 2 ) 1 ) 0 .

list

= 1 ( 2 ( 3 ( 4 ) 3 ) 2 ) 1 ) 0 .

len = 9

len

=7

isPalindrome: l i s t = 2 ( 3 ( 4 ) 3 ) 2 ) 1 ) 0. len = 5

CrackingTheCodinglnterview.com | 6 t h Edition

22 3

Solutions to Chapter 2 | Linked Lists
4

isPalindrome: l i s t = 3 ( 4 ) 3 ) 2 ) 1 ) 0. len = 3

5
isPalindrome: l i s t = 4 ) 3 ) 2 ) 1 ) 0 .
6
r e t u r n s node 3b, t r u e
7
r e t u r n s node 2b, t r u e
8
r e t u r n s node l b , t r u e
9
r e t u r n s node 0b, t r u e
10 returns n u l l , true

len=l

Implementing this code is now just a matter of filling in the details.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39

boolean isPalindrome(LinkedListNode head) {
i n t length = lengthOfList(head);
Result p = isPalindromeRecurse(head, l e n g t h ) ;
return p.result;
>
Result isPalindromeRecurse(LinkedListNode head, i n t l e n g t h ) {
if (head == n u l l || l e n g t h <= 0) { // Even number of nodes
r e t u r n new Result(head, t r u e ) ;
> e l s e if ( l e n g t h -= 1) { // Odd number of nodes
r e t u r n new R e s u l t ( h e a d . n e x t , t r u e ) ;
>
/* Recurse on s u b l i s t . */
Result res = isPalindromeRecurse(head.next, l e n g t h - 2 ) ;
/* If c h i l d c a l l s are not a palindrome, pass back up
* a f a i l u r e . */
if ( I r e s . r e s u l t || res.node == n u l l ) {
return res;
)
/* Check if matches corresponding node on o t h e r s i d e .
r e s . r e s u l t = (head.data == r e s . n o d e . d a t a ) ;
/* Return corresponding node.
res.node = r e s . n o d e . n e x t ;

*/

*/

return res;
>
i n t l e n g t h O f L i s t ( L i n k e d L i s t N o d e n) {
i n t s i z e = 0;
w h i l e (n != n u l l ) {
size++;
n = n.next;
>
return size;
}

Some of you might be wondering why we went through all this effort to create a special R e s u l t class. Isn't
there a better way? Not realiy—at least not in Java.
However, if we were implementing this in Cor C++, we could have passed in a double pointer.
1

bool isPalindromeRecurse(Node head, i n t l e n g t h , Mode** next) {

2

3

}

It's ugly, but it works.

Î26

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
2.7

Intersection: Given two (singly) linked lists, determine if the two lists intersect. Return the
intersecting node. Note that the intersection is defined based on reference, not value. That is, if the
kth node of the first linked list is the exact same node (by reference) as the j t h node of the second
linked list, then they are intersecting.
pg95

SOLUTION
Let's draw a picture of intersecting linked lists to get a better feel for what is going on.
Here is a picture of intersecting linked lists:

And here is a picture of non-intersecting linked lists:

G M I M I M i M i M i M D
G M i M l W i M D
We should be careful here to not inadvertently draw a special case by making the linked lists the same
length.
Let's first ask how we would determine if two linked lists intersect.
Determining if there's an intersection.
How would we detect if two linked lists intersect? One approach would be to use a hash table and just
throw all the linked lists nodes into there. We would need to be careful to reference the linked lists by their
memory location, not by their value.
There's an easier way though. Observe that two intersecting linked lists will always have the same last node.
Therefore, we can just traverse to the end of each linked list and compare the last nodes.
How do we find where the intersection is, though?
Finding the intersecting node.
One thought is that we could traverse backwards through each linked list. When the linked lists "split" that's
the intersection. Of course, you can't really traverse backwards through a singly linked list.
If the linked lists were the same length, you could just traverse through them at the same time. When they
collide, that's your intersection.

CrackingTheCodinglnterview.com | 6th Edition

22 3

Solutions to Chapter 2 | Linked Lists

When they're not the same length, we'd like to just "chop off"—or ignore—those excess (gray) nodes.
How can we do this? Well, if we know the lengths of the two linked lists, then the difference between those
two linked lists will tell us how much to chop off.
We can get the lengths at the same time as we get the tails of the linked lists (which we used in the first step
to determine if there's an intersection).
Putting it all together.
We now have a multistep process.
1. Run through each linked list to get the lengths and the tails.
2. Compare the tails. If they are different (by reference, not by value), return immediately. There is no intersection.
3. Set two pointers to the start of each linked list.
4. On the longer linked list, advance its pointer by the difference in lengths.
5. Now, traverse on each linked list until the pointers are the same.
The implementation for this is below.
1
LinkedListNode f i n d ! n t e r s e c t i o n ( L i n k e d L i s t N o d e l i s t l , LinkedListNode l i s t 2 ) {
2
if ( l i s t l
null || list2
null) return n u l l ;
3
4
/* Get t a i l and s i z e s . */
5
Result r e s u l t l = g e t T a i l A n d S i z e ( l i s t l ) ;
6
Result r e s u l t 2 = g e t T a i l A n d S i z e ( l i s t 2 ) ;
7
8
/ * I f d i f f e r e n t t a i l nodes, then t h e r e ' s n o i n t e r s e c t i o n . * /
9
if ( r e s u l t l . t a i l 1= r e s u l t 2 . t a i l ) {
10
return n u l l ;
11
>
12
13
/ * Set p o i n t e r s t o the s t a r t o f each l i n k e d l i s t . * /
14
LinkedListNode s h o r t e r = r e s u l t l . s i z e < r e s u l t 2 . s i z e ? l i s t l : l i s t 2 ;
15
LinkedListNode longer = r e s u l t l . s i z e < r e s u l t 2 . s i z e ? I i s t 2 : l i s t l ;
16
17
/ * Advance the p o i n t e r f o r t h e longer l i n k e d l i s t b y d i f f e r e n c e i n l e n g t h s . * /
18
longer = getKthNode(longer, M a t h . a b s ( r e s u l t l . s i z e - r e s u l t 2 . s i z e ) ) ;
19
20
/* Move both p o i n t e r s u n t i l you have a c o l l i s i o n . */
21
w h i l e ( s h o r t e r != longer) {
22
shorter = shorter.next;
23
longer = l o n g e r , n e x t ;
24
)
25
26
/* Return e i t h e r one. */
27
return longer;
28 >
29

Î26

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
30 c l a s s Result (
31
p u b l i c LinkedListNode t a i l ;
32
public i n t size;
33
p u b l i c Result(LinkedListNode t a i l , i n t s i z e ) {
34
this.tail = tail;
35
this,size = size;
36
}
37
38
39 Result getTailAndSize(LinkedListNode l i s t ) {
40
if ( l i s t == null) return n u l l ;
41
42
i n t s i z e = 1;
4ï
LinkedListNode c u r r e n t = l i s t ;
44
w h i l e ( c u r r e n t . n e x t 1= n u l l ) {
45
size++;
46
current = current.next;
47
48
r e t u r n new R e s u l t ( c u r r e n t j s i z e ) ;
49
50
51 LinkedListNode getKthNode(LinkedListNode head, i n t k) {
52
LinkedListNode c u r r e n t = head;
53
w h i l e (k > 0 && c u r r e n t != n u l l ) {
54
current = current.next;
55
k--;
56
}
return current;
57
58

>

>

>

>

This algorithm takes 0 ( A + B) time, where A and B are the lengths of the two linked lists, it takes 0 ( 1 )
additional space.

2.8

Loop Detection: Given a circular linked list, implement an algorithm that returns the node at the
beginning of the loop.
DEFINITION
Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so
as to make a loop in the linked list.
EXAMPLE
Input:

A -> B -> C -> D -> E -> C [the same C as earlier]

Output:

C
pg95

SOLUTION
This is a modification of a classic interview problem: detect if a linked list has a loop. Let's apply the Pattern
Matching approach.
Part 1: Detect If Linked List Has A Loop
An easy way to detect if a linked list has a loop is through the F a s t R u n n e r / SlowRunner approach.
F a s t Runner moves two steps at a time, while SlowRunner moves one step. Much like two cars racing
around a track at different steps, they must eventually meet.

CrackingTheCodinglnterview.com | 6th Edition

22 3

Solutions to Chapter 2 | Linked Lists
An astute reader may wonder if Fast Runner might "hop over" SlowRunner compfetely, without
ever colliding. That's not possible. Suppose that F a s t R u n n e r did hop over SlowRunner, such that
SlowRunner is at spot i and F a s t R u n n e r is at spot i + 1, In the previous step, SlowRunner would
be at spot i - l a n d F a s t R u n n e r would at spot ( ( i + 1) - 2), or spot i - 1. That is, they would
have collided.
Part 2: When Do They Collide?
Let's assume that the linked list has a "non-looped" part of size k.
If we apply our algorithm from part 1, when wilt F a s t R u n n e r and SlowRunner collide?
We know that for every p steps that SlowRunner takes, F a s t R u n n e r has taken 2p steps. Therefore, when
SlowRunner enters the looped portion after k steps, F a s t R u n n e r has taken 2k steps total and must be
2k - k steps, or k steps, into the looped portion. Since k might be much larger than the loop length, we
should actually write this as mod ( k , LOOP_SIZE) steps, which we will denote asK.
At each subsequent step, F a s t R u n n e r and SlowRunner get either one step farther away or one step
closer, depending on your perspective. That is, because we are in a circle, when A moves q steps away from
B, it is also moving q steps closer to B.
So now we know the following facts:
1. SlowRunner is 0 steps into the loop.
2. F a s t R u n n e r is K steps into the loop.
3. SlowRunner is K steps behind F a s t R u n n e r .
4. F a s t R u n n e r is LOOP_SIZE - K steps behind SlowRunner.
5. F a s t R u n n e r catches up to SlowRunner at a rate of 1 step per unit of time.
So, when do they meet? Well, if F a s t R u n n e r is L00P_SIZE

-

K steps behind SlowRunner, and

F a s t R u n n e r catches up at a rate of 1 step per unit of time, then they meet after LOOP_SIZE - K steps.
At this point, they will be K steps before the head of the loop. Let's call this point C o l l i s i o n S p o t .

nl and n2 will meet here,
three nodes from start of loop

Part 3: How Do You Find The Start of the Loop?
We now know that C o l l i s i o n S p o t is K nodes before the start of the loop. Because K = m o d ( k , LOOP_
S I Z E ) (or, in other words, k = K + M * LOOP_SIZE, for any integer M), it is also correct to say that it is
k nodes from the loop start. For example, if node N is 2 nodes into a 5 node loop, it is also correct to say that
it is 7,12, or even 397 nodes into the loop.
Therefore, both C o l l i s i o n S p o t and L i n k e d L i s t H e a d are k nodes from the start of the loop.

Î26

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Chapter 2 | Linked Lists
Now, if we keep one p o i n t e r a t C o l l i s i o n S p o t and move the other one to L i n k e d L i s t H e a d , they will
each be k nodes from L o o p S t a r t . Moving the two pointers at the same speed will cause them to coflide
again—this time after k steps, at which point they will both be at L o o p S t a r t . All we have to do is return
this node.
Part 4: Putting It AH Together
To summarize, we move F a s t P o i n t e r twice as fast as S l o w P o i n t e r , When S l o w P o i n t e r enters
the loop, after k nodes, F a s t P o i n t e r is k nodes into the loop. This means that F a s t P o i n t e r and
S l o w P o i n t e r are LOOP_SIZE - k nodes away from each other.
Next, if F a s t P o i n t e r moves two nodes for each node that S l o w P o i n t e r moves, they move one node
closer to each other on each turn. Therefore, they will meet after LOOP_SIZE

-

k turns. Both will be k

nodes from the front of the loop.
The head of the linked list is also k nodes from the front of the loop. So, if we keep one pointer where it is,
and move the other pointer to the head of the linked list, then they will meet at the front of the loop.
Our algorithm is derived directly from parts 1,2 and 3.
1. Create two pointers, F a s t P o i n t e r and S l o w P o i n t e r .
2. Move F a s t P o i n t e r at a rate of 2 steps and S l o w P o i n t e r at a rate of 1 step.
3. When they collide, move S l o w P o i n t e r to L i n k e d L i s t H e a d . Keep F a s t P o i n t e r where it is.
4. Move S l o w P o i n t e r and F a s t P o i n t e r at a rate of one step. Return the new collision point.
The code below implements this algorithm.
1
2
3
4
5
6
7
8
9
19
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29

LinkedListNode FindBeginning(LinkedListNode head) {
LinkedListNode slow = head;
LinkedListNode f a s t = head;
/* Find meeting p o i n t . This w i l l be LOOP_SI2E - k steps i n t o the l i n k e d l i s t . */
w h i l e ( f a s t 1= n u l l && f a s t . n e x t 1= n u l l ) {
slow = s l o w . n e x t ;
fast » fast.next.next;
if (slow
f a s t ) { II C o l l i s i o n
break;
>
}
/* E r r o r check - no meeting p o i n t , and t h e r e f o r e no loop */
if ( f a s t
n u l l || f a s t . n e x t == n u l l ) {
return n u l l ;
>
/" Move slow to Head. Keep f a s t at Meeting P o i n t . Each are k steps from the
* Loop S t a r t . If they move at t h e same pace, they must meet at Loop S t a r t . */
slow = head;
w h i l e (slow != f a s t ) {
slow = s l o w . n e x t ;
fast = fast.next;
}
/* Both now p o i n t to the s t a r t of the l o o p . */
return f a s t ;
}

CrackingTheCodinglnterview.com | 6th Edition

22 3

Solutions to Chapter 2 | Linked Lists

Î26

Cracking the Coding Interview, 6 t h Edition

3
Solutions to Stacks and Queues

3.1

Three in One: Describe how you could use a single array to implement three stacks.
pg98

SOLUTION
Like many problems, this one somewhat depends on how well we'd like to support these stacks. If we're
okay with simply allocating a fixed amount of space for each stack, we can do that. This may mean though
that one stack runs out of space, while the others are nearly empty.
Alternatively, we can be flexible in our space allocation, but this significantly increases the complexity of
the problem.
Approach 1: Fixed Division
We can divide the array in three equal parts and allow the individual stack to grow in that limited space.
Note: We will use the notation"[" to mean inclusive of an end point and"(" to mean exclusive of an end
point.
•

For stack 1, we will use [ Q ,

•

For stack 2, we will use [ "A ,

•

For stack 3, we will use [ % ,

A ).
2n

A) •

n).

The code for this solution is below.
1
2
3
4
5

c l a s s FixedMultiStack {
p r i v a t e i n t numberOfStacks = 3;
p r i v a t e i n t stackCapacity;
p r i v a t e i n t [ ] values;
private i n t [ ] sizes;

6
7
8
9
10
11
12
13
14
15
16
17

p u b l i c F i x e d M u l t i S t a c k ( i n t stackSize) {
stackCapacity = s t a c k S i z e ;
values » new i n t [ s t a c k S i z e * numberOfStacks];
sizes = new intfnumberOfStacks];
>
/* Push value onto stack. */
p u b l i c void p u s h { i n t stackNum, i n t value) throws FullStackException {
/* Check t h a t we have space f o r t h e next element */
if ( i s F u l l ( s t a c k N u f f l ) ) {
throw new F u l l S t a c k E x c e p t i o n ( ) ;

CrackingTheCodinglnterview.com | 6 t h Edition

227

Solutions to Chapter 3 j Stacks and Queues
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
50
61
62 >

}
/* Increment stack p o i n t e r and then update top v a l u e .
sizes[stackNum]++;
values[indexOfTop(stackNum)] = v a l u e ;

*/

>
/* Pop item from top s t a c k . */
p u b l i c i n t p o p ( i n t stackNum) {
if (isEmpty(stackNum)) {
throw new EmptyStackException();
}
i n t toplndex = indexOfTop(stackNum);
i n t value = v a l u e s [ t o p ! n d e x ] ; // Get top
v a l u e s f t o p l n d e x ] = 0; // Clear
s i z e s [ s t a c k N u m ] - - ; // Shrink
r e t u r n value;
}
/* Return top element. */
p u b l i c i n t p e e k ( i n t stackNum) {
if (isEmpty(stackNura)) {
throw new EmptyStackException();
}
r e t u r n values[indexOfTop(stackNum)];
}
/ * Return i f stack i s empty. * /
p u b l i c boolean isErnpty(int stackNum) {
r e t u r n sizes]; stackNum] == 0;
}
t * Return i f stack i s f u l l . * /
p u b l i c boolean i s F u l l ( i n t stackNum) {
r e t u r n sizes[stackNum] == stackCapacity;
}
/* Returns index of t h e top of t h e s t a c k .
p r i v a t e i n t indexOfTop(int stackNum) {
i n t o f f s e t = stackNum + stackCapacity;
i n t s i z e = sizes[stackNum];
r e t u r n o f f s e t + size - 1;
}

*/

If we had additional information about the expected usages of the stacks, then we could modify this algorithm accordingly. For example, if we expected Stack 1 to have many more elements than Stack 2, we could
allocate more space to Stack 1 and less space to Stack 2.
Approach 2: Flexible Divisions
A second approach is to allow the stack blocks to be flexible in size. When one stack exceeds its initial
capacity, we grow the allowable capacity and shift elements as necessary.
We will also design our array to be circular, such that the finai stack may start at the end of the array and
wrap around to the beginning.

22S

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 3 | Stacks and Queues
Please note that the code for this solution is far more complex than would be appropriate for an interview.
You could be responsible for pseudocode, or perhaps the code of individual components, but the entire
implementation would be far too much work.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25

public class MultiStack {
/* S t a c k l n f o is a simple class t h a t holds a set of data about each s t a c k . It
* does not hold the a c t u a l items in the s t a c k . We could have done t h i s w i t h
* j u s t a bunch of i n d i v i d u a l v a r i a b l e s , but t h a t J s messy and doesn't gain us
* much, */
private class Stacklnfo {
public i n t s t a r t , size, capacity;
public S t a c k l n f o ( i n t s t a r t , i n t capacity) {
this.start = start;
this.capacity = capacity;
>
/* Check if an index on t h e f u l l array is w i t h i n the stack boundaries. The
* stack can wrap around to the s t a r t of t h e a r r a y . */
p u b l i c boolean i s W i t h i n S t a c k C a p a c i t y ( i n t index) {
/ * I f o u t s i d e o f bounds o f a r r a y , r e t u r n f a l s e . * /
if (index < 9 || index >= v a l u e s . l e n g t h ) {
return false;
>
i * I f index wraps around, a d j u s t i t . * /
i n t contiguouslndex = index < s t a r t ? index + v a l u e s . l e n g t h : index;
i n t end = s t a r t + c a p a c i t y ;
r e t u r n s t a r t <= contiguouslndex && contiguouslndex < end;
>

26

27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53

public i n t lastCapacitylndexQ {
return adjustlndex(start + capacity - 1);
)
public i n t lastElementlndexQ {
return adjustlndex(start + size - 1);
>
p u b l i c boolean i s F u l l Q { r e t u r n s i z e == c a p a c i t y ; }
p u b l i c boolean isEmptyQ { r e t u r n s i z e == 0; )
>
private Stacklnfof] info;
private i n t [ ] values;
p u b l i c M u l t i S t a c k ( i n t numberOfStacks, i n t d e f a u l t S i z e ) {
/ * Create metadata f o r a l l t h e stacks. * /
i n f o = new StackInfo[numberOfStacks];
f o r ( i n t i = 0; i < numberOfStacks; i++) {
i n f o [ i ] = new S t a c k I n f o ( d e f a u l t S i z e * i, d e f a u l t S i z e ) ;
>
values = new int[numberOfStacks * d e f a u l t S i z e ] ;
>
/* Push value onto stack nurn, s h i f t i n g / e x p a n d i n g stacks as necessary. Throws
* exception if a l l stacks are f u l l . V
p u b l i c voicf p u s h ( i n t stackNum, i n t value) throws FullStackException {

CrackingTheCodinglnterview.com ] 6 t h Edition

239

Solutions to Chapter 3 j Stacks and Queues
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79

if
}

/ * I f t h i s stack i s f u l l , expand i t .
S t a c k l n f o stack = info[stackNum);
if ( s t a c k , i s F u l l ( ) ) {
expand(stackNum);
>

*/

/* Find the index of t h e top element in t h e array + 1, and increment the
* stack p o i n t e r */
stack.size++;
v a l u e s f s t a c k . l a s t E l e m e n t l n d e x O ] = value;
}
/* Remove value from s t a c k . */
p u b l i c i n t p o p ( i n t stackNum) throws Exception {
S t a c k l n f o stack = i n f o [ s t a c k N u m ] ;
if ( s t a c k . i s E m p t y Q ) {
throw new EmptyStackException();
>
/* Remove l a s t element. */
i n t value = v a l u e s [ s t a c k . l a s t E l e m e n t I n d e x ( ) ] ;
v a l u e s [ s t a c k . l a s t E l e m e n t l n d e x ( ) ] = 0; // Clear item
s t a c k . s i z e - - ; I I Shrink s i z e
r e t u r n value;

80

81

(allStacksAreFull()) {
throw new F u l l S t a c k E x c e p t i o n ( ) ;

82

>

83
84
85
86
87
88
89
90
91
92
93
94
95

/* Get top element of s t a c k . * /
p u b l i c i n t p e e k ( i n t stackNum) {
S t a c k l n f o stack = i n f o [ s t a c k N u m ] ;
return values[stack.lastElementlndex()];
}
/* S h i f t items in stack over by one element. If we have a v a i l a b l e c a p a c i t y , then
* w e ' l l end up s h r i n k i n g t h e stack by one element. If we d o n ' t have a v a i l a b l e
* c a p a c i t y , then w e ' l l need to s h i f t the next stack over t o o . */
p r i v a t e void s h i f t f i n t stackNum) {
S y s t e m . o u t . p r i n t i n g ' / / / S h i f t i n g " + stackNum);
S t a c k l n f o stack = i n f o [ s t a c k N u m ] ;

98
99
100
101
102
103
104
105
106
107
108
109

22S

/ * I f t h i s stack i s a t i t s f u l l c a p a c i t y , then you need t o move the next
* stack over by one element. This stack can now c l a i m the f r e e d index. */
if ( s t a c k . s i z e >= s t a c k . c a p a c i t y ) {
i n t nextStack = (stackNum + 1) % i n f o . l e n g t h ;
shift(nextStack);
s t a c k . c a p a c i t y + + ; / / c l a i m index t h a t next stack l o s t
)
/ * S h i f t a l l elements i n stack over b y one. * /
i n t index = s t a c k . l a s t C a p a c i t y l n d e x Q ;
while (stack.isWithinstackCapacity(index)) {
values[index] = values[previouslndex(index)];
index = p r e v i o u s l n d e x ( i n d e x ) ;
}

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 3 | Stacks and Queues
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155 >

I* Adjust stack data. */
v a l u e s [ s t a c k . s t a r t ] = 0; // Clear item
s t a c k , s t a r t =• n e x t l n d e x ( s t a c k . s t a r t ) ; // move s t a r t
s t a c k . c a p a c i t y - - ; I I Shrink c a p a c i t y
>
/* Expand stack by s h i f t i n g over other stacks */
p r i v a t e void expand(int stackNum) {
shift((StackNum + 1) % i n f o . l e n g t h ) ;
info[stackNum],capacity++;
>
/* Returns the number of items a c t u a l l y present in stack.
p u b l i c i n t nuirberOfElementsQ {
i n t s i z e = 0;
f o r ( S t a c k l n f o sd : i n f o ) {
s i z e += s d . s i z e ;
>
return size;
>

*/

/ * Returns t r u e i s a l l the stacks are f u l l . * /
p u b l i c boolean a l l S t a c k s A r e F u l l Q {
r e t u r n numberOfElements() == v a l u e s . l e n g t h ;
>
/* Adjust index to be w i t h i n the range of 0 -> length - 1. */
p r i v a t e i n t a d j u s t l n d e x ( i n t index) {
|* l a v a ' s mod o p e r a t o r can r e t u r n neg values. For example, ( - 1 1 % 5) w i l l
* r e t u r n - 1 , not 4. We a c t u a l l y want the value to be 4 ( s i n c e we're wrapping
* around the i n d e x ) . */
i n t max = v a l u e s . l e n g t h ;
r e t u r n ( ( i n d e x % max) + max) % max;
>
/* Get index a f t e r t h i s index, adjusted f o r wrap around. */
p r i v a t e i n t n e x t l n d e x ( i n t index) {
return adjustlndex(index + 1);
>
/* Get index before t h i s index, adjusted f o r wrap around.
p r i v a t e i n t p r e v i o u s l n d e x ( i n t index) {
return adjustlndex(index - 1);
}

*/

In problems like this, it's important to focus on writing clean, maintainable code. You should use additional
classes, as we did with S t a c k l n f o , and pull chunks of code into separate methods. Of course, this advice
applies to the "real world"as well.

CrackingTheCodinglnterview.com ] 6 t h Edition

239

Solutions to Chapter 3 j Stacks and Queues
3.2

Stack Min: How would you design a stack which, in addition to push and pop, has a function min
which returns the minimum element? Push, pop and min should all operate in 0 ( 1 ) time.
pg 98

SOLUTION
The thing with minimums is that they don't change very often. They only change when a smaller element
is added.
One solution is to have just a single i n t value, m i n V a l u e , that's a member of the S t a c k class. When
m i n V a l u e is popped from the stack, we search through the stack to find the new minimum. Unfortunately,
this would break the constraint that push and pop operate in 0 ( 1 ) time.
To further understand this question, let's walk through it with a short example:
push(5);
push(6);
push(3);
push(7);
p o p ( ) ; II
p o p ( ) ; II

I I stack
I I stack
I I stack
// stack
pops 7.
pops 3.

i s { 5 } , min i s 5
i s { 6 , 5 ) , min i s 5
i s { 3 , 6 , 5 } , min i s 3
is { 7 , 3, 6, 5 ) , min is 3
stack is { 3 , 6, 5 ) , min is 3
stack is { 6 , 5>. min is 5.

Observe how once the stack goes back to a prior state ( { 6 ,
state (5). This leads us to our second solution.

5 » , the minimum also goes back to its prior

If we kept track of the minimum at each state, we would be able to easily know the minimum. We can do
this by having each node record what the minimum beneath itself is. Then, to find the min, you just look at
what the top element thinks is the min.
When you push an element onto the stack, the element is given the current minimum, it sets its " l o c a l
m i n " t o be the min.
1
2

p u b l i c c l a s s StackWithMin extends Stack<NodeWithMin> {
p u b l i c v o i d p u s h ( i n t value) {
i n t newMin = Math.min(value, m i n ( ) ) ;
super.push(new NodeWithMin(value, newMin));
}

4
5
6
7
p u b l i c i n t min() {
8
if ( t h i s . i s E m p t y O ) {
9
r e t u r n Integer.MAX_VALUE; // Error value
16
) else {
11
return peek(),min;
12
>
13
>
14 >
15
16 class NodeWithMin {
17
p u b l i c i n t value;
18
p u b l i c i n t min;
19
p u b l i c NodeWithMin(int v, i n t m i n ) {
20
value = v;
21
t h i s . m i n = min;
22
)
23 }

There's just one issue with this: if we have a large stack, we waste a lot of space by keeping track of the m i n
for every single element. Can we do better?

22S

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Chapter 3 | Stacks and Queues
We can (maybe) do a bit better than this by using an additional stack which keeps track of the mins.
1
2
4
5
6

p u b l i c class StackWithMin2 extends Stack<lnteger> {
Stack<Integer> s2;
p u b l i c StackWithMin2() {
s2 = new S t a c k < l n t e g e r > ( ) ;
>

8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29 >

p u b l i c void p u s h ( i n t v a l u e ) {
if (value <= irtinQ) {
s2.push(value);
}
super.push(value)j
}
p u b l i c I n t e g e r popQ {
i n t value = s u p e r . p o p Q ;
if (value == m i n Q ) {
s2.pop();
}
return value;
>
p u b l i c i n t minQ {
if ( s 2 . i s E r r p t y ( ) ) {
r e t u r n Integer.MAXVALUE;
} else {
return s2.peek();
>
>

Why might this be more space efficient? Suppose we had a very large stack and the first element inserted
happened to be the minimum. In the first solution, we would be keeping n integers, where n is the size of
the stack. In the second solution though, we store just a few pieces of data: a second stack with one element
and the members within this stack.

3.3

Stack of Plates: Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
Therefore, in real life, we would likely start a new stack when the previous stack exceeds some
threshold. Implement a data structure S e t O f S t a c k s that mimics this. S e t O f S t a c k s should be
composed of several stacks and should create a new stack once the previous one exceeds capacity,
S e t O f S t a c k s . p u s h ( ) and S e t O f S t a c k s . p o p O should behave identically to a single stack
(that is, p o p ( ) should return the same values as it would if there were just a single stack).
FOLLOW UP
Implement a function p o p A t ( i n t
stack.

i n d e x ) which performs a pop operation on a specific subpg 99

SOLUTION
In this problem, we've been told what our data structure should look like:
1
2
3

c l a s s SetOfStacks {
A r r a y L i s t < 5 t a c k > stacks = new A r r a y L i s t < S t a c k > ( ) ;
p u b l i c void p u s h f i n t v) { . . . }

CrackingTheCodinglnterview.com ] 6 t h Edition

239

Solutions to Chapter 3 j Stacks and Queues
4
5

p u b l i c i n t pop() { . . • }
>

We know that push () should behave identically to a single stack, which means that we need push () to
call push ( ) on the last stack in the array of stacks. We have to be a bit careful here though: if the last stack
is at capacity, we need to create a new stack. Our code should look something like this:
1
2
3
4
5
6
8
9
10

void p u s h f i n t v) {
Stack l a s t = g e t L a s t S t a c k Q ;
if ( l a s t != n u l l && 1 l a s t . i s F u l l Q ) { U add to l a s t stack
lsst.push(v);
} e l s e { // must create new stack
Stack stack = new S t a c k ( c a p a c i t y ) ;
stack,push(v);
stacks.add(stack);
}
}

What shouid pop( } do? It should behave similarly to p u s h ( ) in that it should operate on the last stack. If
the last stack is empty (after popping), then we should remove the stack from the list of stacks.
1
2
3
4
5
6

i n t pop() {
Stack l a s t = g e t L a s t S t a c k Q ;
if ( l a s t == n u l l ) throw new EmptyStackExceptionQ;
int v = last.pop();
if ( l a s t . s i z e =•= 0) s t a c k s . r e m o v e ( s t a c k s . s i z e ( ) - 1 ) ;
r e t u r n v;

7

}

Follow Up: Implement popAt(int Index)
This is a bit trickier to implement, but we can imagine a "rollover" system. If we pop an element from stack
1, we need to remove the bottom of stack 2 and push it onto stack 1. We then need to rollover from stack 3
to stack 2, stack 4 to stack 3, etc.
You could make an argument that, rather than "rolling over," we should be okay with some stacks not
being at full capacity. This would improve the time complexity (by a fair amount, with a large number of
elements), but it might get us into tricky situations later on if someone assumes that all stacks (other than
the last) operate at full capacity. There's no "right answer" here; you should discuss this trade-off with your
interviewer.
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18

2

p u b l i c c l a s s SetOfStacks {
ArrayList<Stack> stacks = new A r r a y L i s t < S t a c k > ( ) ;
public i n t capacity;
public SetOfStacks(int capacity) {
t h i s . c a p a c i t y = capacity;
}
p u b l i c Stack g e t L a s t S t a c k Q {
if ( s t a c k s . s i z e ( ) == 0) r e t u r n n u l l ;
return stacks.get(stacks.size() - 1);
}
p u b l i c void p u s h ( i n t v) { /* see e a r l i e r code */ }
p u b l i c i n t pop() { /* see e a r l i e r code */ >
p u b l i c boolean isEmptyQ {
Stack l a s t = g e t L a s t S t a c k Q ;
r e t u r n l a s t == n u l l || l a s t . i s E r a p t y Q ;
)

2S

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 3 | Stacks and Queues
19
29
21

p u b l i c i n t p o p A t ( i n t index) {
return leftShift(index, true);

22

}

23
24
p u b l i c i n t l e f t S h i f t ( i n t index, boolean removeTop) {
25
Stack stack = s t a c k s . g e t ( i n d e x ) ;
26
i n t removed_item;
27
if (removeTop) removecf_item = s t a c k . p o p ( ) ;
28
e l s e removed_item = stack.removeBottom();
29
if ( s t a c k . i s E m p t y O ) {
30
stacks.remove(index);
31
} e l s e if ( s t a c k s . s i z e ( ) > index + 1) {
32
i n t v = l e f t S h i f t ( i n d e x + 1, f a l s e ) ;
33
stack.push(v);
34
}
35
r e t u r n removed_item;
36
}
37 >
38
39 p u b l i c c l a s s Stack {
40
private i n t capacity;
41
p u b l i c Node t o p , bottom;
42
p u b l i c i n t s i z e = 0;
43
44
public Stack(int capacity) { this.capacity = capacity; >
45
p u b l i c boolean i s f u l l ( ) { r e t u r n capacity == s i z e ; }
46
47
p u b l i c void join(Node above, Mode below) <
48
if (below != n u l l ) below.above = above;
49
if (above != n u l l ) above.below = below;
50
}
51
52
p u b l i c boolean p u s h ( i n t v) {
if (size >= capacity) return f a l s e ;
54
size++;
55
Node n = new Node(v);
56
if ( s i z e == 1) bottom = n;
57
join(n, top);
58
t o p = n;
59
return true;
60
)
61
62
p u b l i c i n t pop() {
63
Node t = t o p ;
64
top = top.below;
65
size--;
66
return t.value;
67
}
68
69
p u b l i c boolean isEmptyO {
70
r e t u r n s i z e — 0;
71
)
72
73
p u b l i c i n t removeBottom() {
74
Node b = bottom;

CrackingTheCodinglnterview.com ] 6th Edition

239

Solutions to Chapter 3 j Stacks and Queues
75
76
77
78
79
}
80 >

bottom = bottom.above;
if (bottom != n u l l ) bottom.below = n u l l ;
size--;
return b.value;

This problem is not conceptually that tough, but it requires a lot of code to implement it fully. Your interviewer would not ask you to implement the entire code.
A good strategy on problems like this is to separate code into other methods, like a l e f t S h i f t method
that popAt can call. This will make your code cleaner and give you the opportunity to lay down the skeleton of the code before dealing with some of the details.

3.4

Queue via Stacks: Implement a MyQueue class which implements a queue using two stacks.
pg99

SOLUTION
Since the major difference between a queue and a stack is the order (first-in first-out vs. last-in first-out), we
know that we need to modify p e e k ( ) and p o p ( ) to go in reverse order. We can use our second stack to
reverse the order of the elements (by popping si and pushing the elements on to s2). In such an implementation, on each p e e k ( ) and p o p ( ) operation, we would pop everything from si onto s2, perform
the peek / pop operation, and then push everything back.
This wilt work, but if two pop / peeks are performed back-to-back, we're needlessty moving elements. We
can implement a "lazy" approach where we let the elements sit in s2 until we absolutely must reverse the
elements.
In this approach, s t a c k N e w e s t has the newest elements on top and s t a c k O l d e s t has the oldest
elements on top. When we dequeue an element, we want to remove the oldest element first, and so we
dequeue from s t a c k O l d e s t . If s t a c k O l d e s t is empty, then we want to transfer all elements from
s t a c k N e w e s t into this stack in reverse order. To insert an element, we push onto s t a c k N e w e s t , since it
has the newest elements on top.
The code below implements this algorithm,
l
2
3
4
5
6
7
8
9
10

p u b l i c c l a s s MyQueue<T> {
Stack<T> stackNewest, s t a c k O l d e s t ;

11
12
13
14
15
16
17
18
19

22S

p u b l i c MyQueueQ {
stackNewest = new Stack<T>();
stackOldest = new Stack<T>();
}
public i n t sizeQ {
r e t u r n stackNewest.size() + s t a c k O l d e s t . s i z e ( ) ;

>
p u b l i c void add(T v a l u e ) {
/* Push onto stackNewest, which always has the newest elements on top */
stackNewest.push(value);
>
/* Move elements from stackNewest i n t o stackOldest. This is u s u a l l y done so t h a t
* we can do operations on stackOldest. */

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 3 | Stacks and Queues
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37

private void shiftStacksQ {
if ( s t a c k O l d e s t . isEmptyQ) {
w h i l e (IstackNewest.isEmptyO) {
stackOldest.push(stackNewest.pop());
}
}
>
p u b l i c T peek() {
s h i f t S t a c k s O ; // Ensure stackOldest has t h e c u r r e n t elements
r e t u r n s t a c k O l d e s t . p e e k Q ; / / r e t r i e v e t h e o l d e s t item.
>
p u b l i c T remove() {
s h i f t S t a c k s O ; // Ensure stackOldest has the c u r r e n t elements
r e t u r n s t a c k O l d e s t . p o p ( ) ; // pop the o l d e s t item.
>
}

During your actual interview, you may find that you forget the exact API calls. Don't stress too much if that
happens to you. Most interviewers are okay with your asking for them to refresh your memory on little
details. They're much more concerned with your big picture understanding.
3.5

Sort Stack; Write a program to sort a stack such that the smallest items are on the top. You can use
an additional temporary stack, but you may not copy the elements into any other data structure
(such as an array). The stack supports the following operations: push, pop, peek, and is Empty.
pg99

SOLUTION
One approach is to implement a rudimentary sorting algorithm. We search through the entire stack to find
the minimum element and then push that onto a new stack. Then, we find the new minimum element
and push that. This will actually require a total of three stacks: si is the original stack, s2 is the final sorted
stack, and s3 acts as a buffer during our searching of s i . T o search si for each minimum, we need to pop
elements from si and push them onto the buffer, s3.
Unfortunately, this requires two additionaf stacks, and we can only use one. Can we do better? Yes,
Rather than searching for the minimum repeatedly, we can sort si by inserting each element from si in
order into s2. How would this work?
Imagine we have the following stacks, where s2 is "sorted"and si is not:
Si

S2
12

S

8

10

3

7

1

When we pop 5 from s i , we need to find the right place in s2 to insert this number. In this case, the correct
place is on s2 just above 3. How do we get it there? We can do this by popping 5 from si and holding it
in a temporary variable. Then, we move 12 and 8 over to si (by popping them from s2 and pushing them
onto Si) and then push 5 onto s2.

CrackingTheCodinglnterview.com ] 6 t h Edition

239

Solutions to Chapter 3 | Stacks and Queues
Step i
Si

52

Si

12
8

Step 3

Step 2
52

sl

8
->

S2

8

12

->

12

5

le

3

10

3

10

3

7

1

7

1

7

1

tmp = S

tmp = 5

ttnp =

--

Note that 8 and 12 are still in si—and that's okay! We just repeat the same steps for those two numbers as
we did for 5, each time popping off the top of si and putting it into the "right place 'on s2. (Of course, since
8 and 12 were moved from s2 to si precisely because they were larger than S, the "right place"for these
elements will be right on top of 5, We won't need to muck around with s2's other elements, and the inside
of the below w h i l e loop wili not be run when tmp is 8 or 12.)
1
void sort(Stack<lnteger> s) {
2
Stack<Integer> r = new S t a c k < l n t e g e r > ( ) ;
3
while(Ss.isEmptyO) {
4
/* i n s e r t each element in s in sorted order i n t o r. */
5
i n t tmp = s . p o p ( ) ;
6
w h i l e ( ! r . i s E m p t y ( ) && r . p e e k ( ) > tmp) {
7
s.push(r.pop())j
8
}
9
r.push(tmp);
10
)
11
12
/* Copy the elements from r back i n t o s. */
13
while (Ir.isEmptyQ) {
14
s.push(r.popO);
15
>
16 }
This algorithm is 0( N2) time and 0 ( N ) space.
If we were allowed to use unlimited stacks, we could implement a modified quicksort or mergesort.
With the mergesort solution, we would create two extra stacks and divide the stack into two parts. We
would recursively sort each stack, and then merge them back together in sorted order into the original
stack. Note that this would require the creation of two additional stacks per level of recursion.
With the quicksort solution, we would create two additional stacks and divide the stack into the two stacks
based on a pivot element. The two stacks would be recursively sorted, and then merged back together
into the original stack. Like the earlier solution, this one involves creating two additional stacks per level of
recursion.

22S

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 3 j Stacks and Queues
3.6

Animal Shelter: An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first
out" basis. People must adopt either the "oldest" (based on arrival time) of all animals at the shelter,
or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of
that type). They cannot select which specific animal they would like. Create the data structures to
maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog,
and dequeueCat.You may use the built-in L i n k e d L i s t data structure.
pg 99

SOLUTION
We could explore a variety of solutions to this problem. For instance, we could maintain a single queue.
This would make dequeueAny easy, but dequeueDog and dequeueCat would require iteration through
the queue to find the first dog or cat. This would increase the complexity of the solution and decrease the
efficiency.
An alternative approach that is simple, clean and efficient is to simply use separate queues for dogs and
cats, and to place them within a wrapper class called AnimalQueue.We then store some sort of timestamp
to mark when each animal was enqueued. When we call dequeueAny, we peek at the heads of both the
dog and c a t queue and return the oldest.
1
a b s t r a c t class Animal {
2
private int order;
3
protected S t r i n g name;
4
p u b l i c A n i m a l ( S t r i n g n) { name = n; }
5
p u b l i c v o i d s e t O r d e r ( i n t ord) { order = o r d ; >
6
p u b l i c i n t getOrder() { r e t u r n o r d e r ; }
7
8
/* Compare orders of animals to r e t u r n t h e o l d e r item. */
9
p u b l i c boolean is01derThan(Animal a) {
10
return this.order < a.getOrder();
11
}
12 >
13
14 class AnimalQueue {
15
LinkedList<Dog> dogs = new LinkedList<Dog>();
16
LinkedList<Cat> cats = new L i n k e d L i s t < C a t > ( ) ;
17
p r i v a t e i n t order = 0; // acts as timestamp
18
19
p u b l i c void enqueue(Animal a) {
20
/* Order is used as a s o r t of timestamp, so t h a t we can compare t h e i n s e r t i o n
21
* order of a dog to a c a t . */
22
a.setorder(order);
23
order++;
24
25
if (a instanceof Dog) dogs,addLast((Dog) a ) ;
26
e l s e if (a instanceof Cat) c a t s . a d d L a s t { ( C a t ) a ) ;
27
>
28
29
p u b l i c Animal dequeueAny() {
30
/* Look at tops of dog and cat queues, and pop t h e queue w i t h the o l d e s t
31
* value. */
32
if ( d o g s . s i z e ( ) == 0) {
33
r e t u r n dequeueCatsQ;
34
} e l s e if ( c a t s . s i z e ( ) == 0) {
35
r e t u r n dequeueDogsQ;
36
}

CrackingTheCodinglnterview.com | 6 t h Edition

2 3 9

Solutions to Chapter 3 | Stacks and Queues
37
38
39
40
41
42
43
44
4S
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62

Dog dog = d o g s . p e e k Q j
Cat cat = c a t s . p e e k Q j
if (dog.isOlderThan(cat))
r e t u r n dequeueDogsQ;
> else {
r e t u r n dequeueCatsQ;
}

{

}

p u b l i c Dog dequeueDogsQ {
return dogs.pollQ;
}

>

p u b l i c Cat dequeueCatsQ {
return c a t s . p o l i Q ;
>
>
p u b l i c class Dog extends Animal {
p u b l i c Dog(String n) { s u p e r ( n ) ; >
}
p u b l i c class Cat extends Animal {
p u b l i c C a t ( S t r i n g n) { s u p e r ( n ) ; >
>

It is important that Dog and Cat both inherit from an A n i m a l class since d e q u e u e A n y ( ) needs to be able
to support returning both Dog and Cat objects.
If we wanted, o r d e r could be a true timestamp with the actual date and time. The advantage of this is that
we wouldn't have to set and maintain the numerical order. If we somehow wound up with two animals with
the same timestamp, then (by definition) we don't have an older animal and we could return either one.

2

2

S

Cracking t h e Coding Interview, 6 t h Edition

Solutions to Trees and Graphs

4.1

Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a
route between two nodes.
pg 109

SOLUTION
This problem can be solved by just simple graph traversal, such as depth-first search or breadth-first search.
We start with one of the two nodes and, during traversal, check if the other node is found. We should mark
any node found in the course of the algorithm as "already visited" to avoid cycles and repetition of the
nodes.
The code below provides an iterative implementation of breadth-first search.
1
2
3
4
5
6

enum S t a t e { U n v i s i t e d , V i s i t e d , V i s i t i n g ; >
boolean search(Graph g, Node s t a r t , Node end) {
if ( s t a r t == end) r e t u r n t r u e ;
II operates as Queue
LinkedList<Node> q = new LinkedList<Node>();

8
9
10
U
12
13
14
15
16
17
18
19
20
21
22
23
24
25

f o r (Node u : g.getNodesQ) {
u.state = State.Unvisited;
>
start.state = State.Visiting;
q.add(start);
Node u;
while (Iq.isEmptyO) {
u = q . r e m o v e F i r s t O ; II i . e . , dequeue()
if (u != n u l l ) {
f o r (Node v : u . g e t A d j a c e n t ( ) ) {
if ( v . s t a t e == s t a t e . u n v i s i t e d ) {
i f (v == end) {
return true;
) else {
v.state = State.Visiting;
q.add(v);

26

21
28
29

>
>

>

>

u.state = State.visited;

CrackingTheCodinglnterview.com | 6 t h Edition

241

Solutions to Chapter 4 | Trees and Graphs
36
>
31
return false;
32 >
It may be worth discussing with your interviewer the tradeoffs between breadth-first search and depth-first
search for this and other problems. For example, depth-first search is a bit simpler to implement since it can
be done with simple recursion. Breadth-first search can also be useful to find the shortest path, whereas
depth-first search may traverse one adjacent node very deeply before ever going onto the immediate
neighbors.
4,2

Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an
algorithm to create a binary search tree with minima! height.
pg 109

SOLUTION
To create a tree of minimal height, we need to match the number of nodes in the left subtree to the number
of nodes in the right subtree as much as possible.This means that we want the root to be the middle of the
array, since this would mean that half the elements would be less than the root and half wouid be greater
than it.
We proceed with constructing our tree in a similar fashion. The middle of each subsection of the array
becomes the root of the node. The left half of the array will become our left subtree, and the right half of
the array will become the right subtree.
One way to implement this is to use a simple r o o t , i n s e r t Node ( i n t v) method which inserts the
value v through a recursive process that starts with the root node. This wilt indeed construct a tree with
minimal height but it will not do so very efficiently. Each insertion will require traversing the tree, giving a
total cost of 0 ( N l o g N ) t o t h e t r e e .
Alternatively, we can cut out the extra traversals by recursively using the c r e a t e M i n i m a l B S T method.
This method is passed just a subsection of the array and returns the root of a minimal tree for that array.
The algorithm is as follows:
1. Insert into the tree the middle element of the array.
2. Insert (into the left subtree) the left subarray elements.
3. Insert (into the right subtree) the right subarray elements.
4. Recurse.
The code below implements this algorithm.
1
TreeNode createMlnimalBST(int a r r a y [ ] ) {
2
r e t u r n createMinimalBST(array, 0, a r r a y . l e n g t h - 1 ) ;
3
>
4
5
TreeNode createMinimalBST(int a r r [ ] , i n t s t a r t , i n t end) {
6
if (end < s t a r t ) (
7
return n u l l ;
8
}
9
i n t mid = ( s t a r t + end) / 2;
10
TreeNode n = new T r e e N o d e ( a r r [ m i d ) ) ;
11
n . l e f t = createMinimalBST(arr, s t a r t , mid - 1 ) ;
12
n . r i g h t = createMinimalBST(arr, mid + 1, end);
13
r e t u r n n;

274

Cracking the Coding Interview, 6 t h Edition

Solutions to Chapter 255 | Stacks and Queues
14

}

Although this code does not seem especially complex, it can be very easy to make little off-by-one errors.
Be sure to test these parts of the code very thoroughly.

4.3

List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes
at each depth (e.g., if you have a tree with depth D, you'lf have D linked lists).
pg 109

SOLUTION
Though we might think at first glance that this problem requires a level-by-1 eve I traversal, this isn't actually
necessary. We can traverse the graph any way that we'd like, provided we know which level we're on as we
do so.
We can implement a simple modification of the pre-order traversal algorithm, where we pass in l e v e l +
1 to the next recursive call. The code below provides an implementation using depth-first search.
1
void createLevelLinkedList(TreeNode r o o t , ArrayList<LinkedList<TreeNode>> l i s t s ,
2
int level) {
3
if ( r o o t == n u l l ) r e t u r n ; // base case
4
5
LinkedList<TreeNode> l i s t = n u l l ;
6
i f ( l i s t s . s i z e ( ) = = l e v e l ) { I I Level not contained i n l i s t
7
l i s t = new LinkedList<TreeNode>();
8
/ * Levels are always t r a v e r s e d i n o r d e r . So, i f t h i s i s the f i r s t time we've
9
* v i s i t e d l e v e l i, we must have seen l e v e l s 0 through i - 1. We can
10
* t h e r e f o r e s a f e l y add the l e v e l at the end. */
11
lists.add(list);
12
) else {
13
list = lists.get(level);
14
)
15
list.add(root);
16
createLevelLinkedList(root.left, l i s t s , level + 1);
17
createLevelLinkedList(root.right, l i s t s , level + 1);
18 }
19
20 ArrayList<LinkedList<TreeNode>> createLevelLinkedList(TreeMode r o o t ) {
21
ArrayList<LinkedList<TreeNode>> l i s t s = new ArrayList<LinkedList;<TreeNode>>();
22
createLevelLinkedList(root, l i s t s , 0);
23
return l i s t s ;
24 }
Alternatively, we can also implement a modification of breadth-first search. With this implementation, we
want to iterate through the root first, then level 2, then level 3, and soon.
With each level i, we will have already fully visited all nodes on level i

-

l.Tbis means that to get which

nodes are on level i, we can simply look at all children of the nodes of level i - 1.
The code below implements this algorithm.
1
2
3
4
5
6
7

ArrayList<LinkedList<TreeNode>> createLevelLinkedList(TreeNode r o o t ) {
ArrayList<LinkedList<TreeNode>> r e s u l t = new ArrayHst<LinkedList<TreeNode>>();
/ * r f V i s i t " the r o o t * /
LinkedList<TreeNode> c u r r e n t = new LinkedList<TreeNode>();
if ( r o o t 1= n u l l ) {
current.add(root);
}

CrackingTheCodinglnterview.com ] 6 t h Edition

239

Solutions to Chapter 4 | Trees and Graphs
8
9
10
11
12
13
14
15
16
17
18
19
20
21

w h i l e ( c u r r e n t . s i z e Q > 0) {
r e s u l t . a d d ( c u r r e n t ) ; it Add previous l e v e l
LinkedList<TreeNode> parents = c u r r e n t ; II Go to next l e v e l
c u r r e n t = new LinkedList<TreeNode>();
f o r (TreeNode parent : parents) {
/* V i s i t the children */
if ( p a r e n t . l e f t ! = n u l l ) {
c u r r e n t . adcf( parent. l e f t ) ;
>
if ( p a r e n t . r i g h t != n u l l ) {
current,add(parent.right);
}
>

22

>

23
24

return result;
)

One might ask which of these solutions is more efficient. Both run in 0 ( N ) time, but what about the space
efficiency? At first, we might want to claim that the second solution is more space efficient.
In a sense, that's correct. The first solution uses 0( l o g N) recursive calls (in a balanced tree), each of which
adds a new level to the stack. The second solution, which is iterative, does not require this extra space.
However, both solutions require returning 0 ( N ) data.The extra 0( l o g N) space usage from the recursive
implementation is dwarfed by the 0 (N) data that must be returned. So while the first solution may actually
use more data, they are equally efficient when it comes to "big 0."

4.4

Check Balanced: implement a function to check if a binary tree is balanced. For the purposes of
this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any
node never differ by more than one.
pg 110

SOLUTION
In this question, we've been fortunate enough to be told exactly what balanced means: that for each node,
the two subtrees differ in height by no more than one. We can implement a solution based on this definition. We can simply recurse through the entire tree, and for each node, compute the heights of each subtree.
1
2

i n t getHeight(TreeNode r o o t ) {
if ( r o o t == n u l l ) r e t u r n - 1 ; // Base case
r e t u r n M a t h . m a x ( g e t H e i g h t ( r o o t . l e f t ) , g e t H e i g h t ( r o o t . r i g h t ) ) + 1;
>

4
5
6
boolean is6alanced(TreeNode r o o t ) {
7
i f ( r o o t = = n u l l ) r e t u r n t r u e ; / / Base case
8
9
int heightDiff = getHeight(root.left) - getHeight(root.right);
10
if ( M a t h . a b s ( h e i g h t D i f f ) > 1) {
11
return false;
12
} e l s e { II Recurse
13
r e t u r n i s B a l a n c e d ( r o o t . l e f t ) && i s B a l a n c e d ( r o o t . r i g h t ) ;
14
>
15 >

Ï44

Cracking the Coding Interview, 6 t h Edition
