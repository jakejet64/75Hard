/*
You are given an array of k linked-lists lists,
 each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted
 linked-list and return it.
*/

import 'dart:math';

void main(List<String> arguments) {
  Solution s = new Solution();
  // [[1,4,5],[1,3,4],[2,6]]
  ListNode? answer = s.mergeKLists([new ListNode(1, new ListNode(4, new ListNode(5))),
                       new ListNode(1, new ListNode(3, new ListNode(4))),
                       new ListNode(2, new ListNode(6))]);
  while(answer != null) {
    print(answer.val);
    answer = answer.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}


class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {

    // convert to non-nullable list
    lists = lists.where((node) => node != null)
                 .map((node) => node as ListNode)
                 .toList();

    if(lists.length == 0) return null;
    if(lists.length == 1) return lists.single;

    ListNode smallest = lists.reduce((a, b) => (a!.val < b!.val) ? a : b) as ListNode;
    lists.remove(smallest);
    if(smallest.next != null) lists.add(smallest.next);

    ListNode ret = new ListNode(smallest.val);
    ListNode pointer = ret;

    while(lists.length > 1) {
      smallest = lists.reduce((a, b) => (a!.val < b!.val) ? a : b) as ListNode;
      lists.remove(smallest);
      if(smallest.next != null) lists.add(smallest.next);
      pointer.next = new ListNode(smallest.val);
      pointer = pointer.next as ListNode;
    }

    pointer.next = lists.single;

    return ret;
  }
}