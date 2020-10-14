//
//  FindLowestCommonAncestor.m
//  DataStructureStudy
//
//  Created by jolin on 2020/6/3.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindLowestCommonAncestor.h"
#import "StructureDefine.h"

@implementation FindLowestCommonAncestor

- (instancetype)init
{
    if (self = [super init]) {
        
        /*
                 1
               /   \
              2     3
             / \   / \
            4   5 6   7         9
                     /
                    8
         */
//        composeBinaryTreeHasParentNode();
        composeBinaryTreeWithoutParentNode();
    }
    return self;
}

void composeBinaryTreeHasParentNode() {
    // 构造一棵二叉树
    BinaryTree * rootNode = malloc(sizeof(BinaryTree));
    rootNode->value = 1;
    rootNode->pParrent = NULL;
    
    BinaryTree * left1 = malloc(sizeof(BinaryTree));
    left1->value = 2;
    left1->pParrent = rootNode;
    rootNode->pLeft = left1;
    
    BinaryTree * right1 = malloc(sizeof(BinaryTree));
    right1->value = 3;
    right1->pParrent = rootNode;
    rootNode->pRight = right1;
    
    BinaryTree * left2 = malloc(sizeof(BinaryTree));
    left2->value = 4;
    left2->pParrent = left1;
    left2->pRight = NULL;
    left2->pLeft = NULL;
    left1->pLeft = left2;
    
    BinaryTree * right2 = malloc(sizeof(BinaryTree));
    right2->value = 5;
    right2->pParrent = left1;
    right2->pRight = NULL;
    right2->pLeft = NULL;
    left1->pRight = right2;
    
    BinaryTree * left3 = malloc(sizeof(BinaryTree));
    left3->value = 6;
    left3->pParrent = right1;
    right1->pLeft = left3;
    
    BinaryTree * right3 = malloc(sizeof(BinaryTree));
    right3->value = 7;
    right3->pParrent = right1;
    right3->pRight = NULL;
    right1->pRight = right3;
    
    BinaryTree * left4 = malloc(sizeof(BinaryTree));
    left4->value = 8;
    left4->pParrent = right3;
    left4->pLeft = NULL;
    left4->pRight = NULL;
    right3->pLeft = left4;
    
    BinaryTree * param1 = left4;
    BinaryTree * param2 = right2;
    int value = findLowestCommonAncestor(param1, param2);
    printf("\n--------- findLowestCommonAncestor ---------\n\n");
    if (value >= 0) {
        printf("[%d, %d] => %d\n", param1->value, param2->value, value);
    }
    else {
        printf("[%d, %d] => no common ancestor\n", param1->value, param2->value);
    }
}

int findLowestCommonAncestor(BinaryTree * node1, BinaryTree * node2)
{
    if (!node1 || !node2) return -1;
    
    int value[20] = {0};
    int i = 0;
    int tmp[20] = {0};
    int j = 0;
    BinaryTree * p1 = node1;
    while (p1) {
        value[i++] = p1->value;
        p1 = p1->pParrent;
    }
    BinaryTree * p2 = node2;
    while (p2) {
        tmp[j++] = p2->value;
        p2 = p2->pParrent;
    }
    int m = i - 1, n = j - 1;
    int ancestor = -1;
    for ( ;m >= 0 && n >= 0; m--, n--) {
        if (value[m] != 0 && tmp[n] != 0 && value[m] == tmp[n]) {
            ancestor = value[m];
        }
    }
    return ancestor;
}

#pragma mark - Binary Tree Without Parent Node
void composeBinaryTreeWithoutParentNode() {
    TreeNode * rootNode = malloc(sizeof(TreeNode));
    rootNode->value = 1;
    
    TreeNode * left1 = malloc(sizeof(TreeNode));
    left1->value = 2;
    rootNode->pLeft = left1;
    
    TreeNode * right1 = malloc(sizeof(TreeNode));
    right1->value = 3;
    rootNode->pRight = right1;
    
    TreeNode * left2 = malloc(sizeof(TreeNode));
    left2->value = 4;
    left2->pRight = NULL;
    left2->pLeft = NULL;
    left1->pLeft = left2;
    
    TreeNode * right2 = malloc(sizeof(TreeNode));
    right2->value = 5;
    right2->pRight = NULL;
    right2->pLeft = NULL;
    left1->pRight = right2;
    
    TreeNode * left3 = malloc(sizeof(TreeNode));
    left3->value = 6;
    left3->pLeft = NULL;
    left3->pRight = NULL;
    right1->pLeft = left3;
    
    TreeNode * right3 = malloc(sizeof(TreeNode));
    right3->value = 7;
    right3->pRight = NULL;
    right1->pRight = right3;
    
    TreeNode * left4 = malloc(sizeof(TreeNode));
    left4->value = 8;
    left4->pLeft = NULL;
    left4->pRight = NULL;
    right3->pLeft = left4;
    
    TreeNode * param1 = left4;
    TreeNode * param2 = right2;
    TreeNode * value = findLowestCommonAncestorWithoutParent(rootNode, param1, param2);
    printf("\n--------- findLowestCommonAncestor ---------\n\n");
    if (value) {
        printf("[%d, %d] => %d\n", param1->value, param2->value, value->value);
    }
    else {
        printf("[%d, %d] => no common ancestor\n", param1->value, param2->value);
    }
}

/// 核心思想：从根节点分别往左右两边找给定的节点
TreeNode * findLowestCommonAncestorWithoutParent(TreeNode * root, TreeNode * param1, TreeNode * param2) {
    if (!root || root == param1 || root == param2) return root;
    TreeNode * left = findLowestCommonAncestorWithoutParent(root->pLeft, param1, param2);
    TreeNode * right = findLowestCommonAncestorWithoutParent(root->pRight, param1, param2);
    return !left ? right : (!right ? left : root);
}

@end
