//
//  MirrorOfBinaryTree.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/11.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "MirrorOfBinaryTree.h"
#import "StructureDefine.h"
#import "DJStack.h"

@implementation MirrorOfBinaryTree

- (instancetype)init
{
    if (self = [super init]) {
        
        /*
                        1
                      /   \
                     2     3
                    / \   / \
                   4   5 6   7
         */
        
        TreeNode * tree = treeFromStringArray("[1,2,3,4,5,6,7]");

//        TreeNode * mirror = mirrorBinaryTree(tree1);
        noneRecursiveMirrorBinaryTree(tree);
        printf("\n--------- MirrorOfBinaryTree ---------\n\n");
        printTree(tree);
        printf("\n");
        
    }
    return self;
}

void printTree(TreeNode * tree)
{
    if (!tree) return;
    
    printf("%d ", tree->value);
    printTree(tree->pLeft);
    printTree(tree->pRight);
}


/**
 面试题27: 二叉树的镜像
 
 输入一颗二叉树，输出它的镜像

 @param tree 二叉树的根节点
 @return 二叉树镜像的根节点
 */
TreeNode * mirrorBinaryTree(TreeNode * tree)
{
    if (!tree) return NULL;
    
    TreeNode * root = tree;
    TreeNode * leftTree = root->pLeft ? mirrorBinaryTree(root->pLeft) : NULL;
    TreeNode * rightTree = root->pRight ? mirrorBinaryTree(root->pRight) : NULL;
    root->pLeft = rightTree;
    root->pRight = leftTree;
    
    return root;
}

void noneRecursiveMirrorBinaryTree(TreeNode * tree)
{
    if (!tree) return;
    
    DJStack * stack = [[DJStack alloc] init];
    TreeNode * p = tree;
    [stack push:p];
    
    while (!stack.empty) {
        TreeNode * node = [stack pop];
        
        TreeNode * left = node->pLeft ? node->pLeft : NULL;
        TreeNode * right = node->pRight ? node->pRight : NULL;
        
        node->pLeft = right;
        node->pRight = left;
        
        if (right) {
            [stack push:right];
        }
        if (left) {
            [stack push:left];
        }
    }
}

@end
