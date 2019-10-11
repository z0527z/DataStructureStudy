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
        
        TreeNode * tree1 = malloc(sizeof(TreeNode));
        tree1->pLeft = NULL;
        tree1->pRight = NULL;
        tree1->value = 1;
        
        TreeNode * leftTree = malloc(sizeof(TreeNode));
        leftTree->value = 2;
        leftTree->pLeft = NULL;
        leftTree->pRight = NULL;
        tree1->pLeft = leftTree;

        TreeNode * rightTree = malloc(sizeof(TreeNode));
        rightTree->value = 3;
        rightTree->pLeft = NULL;
        rightTree->pRight = NULL;
        tree1->pRight = rightTree;

        TreeNode * leftTree1 = malloc(sizeof(TreeNode));
        leftTree1->value = 4;
        leftTree1->pLeft = NULL;
        leftTree1->pRight = NULL;
        leftTree->pLeft = leftTree1;
        
        TreeNode * rightTree1 = malloc(sizeof(TreeNode));
        rightTree1->value = 5;
        rightTree1->pLeft = NULL;
        rightTree1->pRight = NULL;

        leftTree->pRight = rightTree1;

        TreeNode * leftTree2 = malloc(sizeof(TreeNode));
        leftTree2->value = 6;
        leftTree2->pLeft = NULL;
        leftTree2->pRight = NULL;
        rightTree->pLeft = leftTree2;

        TreeNode * rightTree2 = malloc(sizeof(TreeNode));
        rightTree2->value = 7;
        rightTree2->pLeft = NULL;
        rightTree2->pRight = NULL;
        rightTree->pRight = rightTree2;

        
//        TreeNode * mirror = mirrorBinaryTree(tree1);
        noneRecursiveMirrorBinaryTree(tree1);
        printf("\n--------- MirrorOfBinaryTree ---------\n\n");
        printTree(tree1);
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
