/*
You are given the heads of two sorted
linked lists list1 and list2.

Merge the two lists in a one sorted list.
The list should be made by splicing together
the nodes of the first two lists.

Return the head of the merged linked list.
*/

function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val);
  this.next = (next===undefined ? null : next);
}

var mergeTwoLists = function(list1, list2) {

  if(!list1) return list2;
  if(!list2) return list1;

  let newList = new ListNode(Math.min(list1.val, list2.val));
  (list1.val < list2.val) ? list1 = list1.next : list2 = list2.next;

  let pointer = newList;

  while(list1 && list2) {
    if(list1.val < list2.val) {
      pointer.next = new ListNode(list1.val);
      pointer = pointer.next;
      list1 = list1.next;
    } else {
      pointer.next = new ListNode(list2.val);
      pointer = pointer.next;
      list2 = list2.next;
    }
  }

  if(list1) {
    pointer.next = list1;
  } else {
    pointer.next = list2;
  }

  return newList;
};