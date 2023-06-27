
 function TreeNode(val, left, right) {
     this.val = (val===undefined ? 0 : val)
     this.left = (left===undefined ? null : left)
     this.right = (right===undefined ? null : right)
 }
/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var isValidBST = function(root, minimum, maximum) {
    if(root == null) return true;
    if(root.val <= minimum || root.val >= maximum) return false;
    return isValidBST(root.left, minimum, root.val) && isValidBST(root.right, root.val, maximum);
};