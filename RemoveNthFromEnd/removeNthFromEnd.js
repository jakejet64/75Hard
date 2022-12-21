/*
Given the head of a linked list,
remove the nth node from the end
of the list and return its head.

Definition for singly-linked list.
 */
function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val)
  this.next = (next===undefined ? null : next)
}

var removeNthFromEnd = function(head, n) {
  let p1 = head;
  let p2 = head;

  for(let i = 0; i <= n; i++) {
    if(!p2) return (i === n) ? head.next : head;
    p2 = p2.next;
  }

  while(p2) {
    p1 = p1.next;
    p2 = p2.next;
  }

  p1.next = p1.next.next;

  return head;
};

let list1 = new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5)))));

let pointer = removeNthFromEnd(list1, 6);

while(pointer) {
  console.log(pointer.val);
  pointer = pointer.next;
}