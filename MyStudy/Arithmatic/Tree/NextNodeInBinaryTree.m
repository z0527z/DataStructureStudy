//
//  NextNodeInBinaryTree.m
//  MyStudy
//
//  Created by jolin on 2019/10/21.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "NextNodeInBinaryTree.h"
#import "StructureDefine.h"


@implementation NextNodeInBinaryTree

- (instancetype)init
{
    if (self = [super init]) {
        
        BinaryTree * root = malloc(sizeof(BinaryTree));
        root->value = 1;
        root->pParrent = NULL;
        root->pLeft = NULL;
        root->pRight = NULL;
        
        BinaryTree * left1 = malloc(sizeof(BinaryTree));
        left1->value = 2;
        left1->pParrent = root;
        left1->pLeft = NULL;
        left1->pRight = NULL;
        
        root->pLeft = left1;
        
        BinaryTree * right6 = malloc(sizeof(BinaryTree));
        right6->value = 6;
        right6->pParrent = root;
        right6->pLeft = NULL;
        right6->pRight = NULL;
        
        root->pRight = right6;
        
        BinaryTree * left2 = malloc(sizeof(BinaryTree));
        left2->value = 3;
        left2->pParrent = left1;
        left2->pLeft = NULL;
        left2->pRight = NULL;
        
        left1->pLeft = left2;
        
        BinaryTree * right1 = malloc(sizeof(BinaryTree));
        right1->value = 4;
        right1->pParrent = left1;
        right1->pLeft = NULL;
        right1->pRight = NULL;
        
        left1->pRight = right1;
        
        BinaryTree * nextNode = nextNodeInInOrderBinaryTreeTraverse(root);
        
        printf("\n-------- NextNodeInBinaryTree --------\n\n");
        if (nextNode) {
            printf("%d\n", nextNode->value);
        }
        
        
    }
    return self;
}

BinaryTree * nextNodeInInOrderBinaryTreeTraverse(BinaryTree * node)
{
    if (!node) return NULL;
    BinaryTree * nextNode = NULL;
    if (node->pRight) {
        nextNode = node->pRight;
        while (nextNode->pLeft) {
            nextNode = nextNode->pLeft;
        }
    }
    else if (node->pParrent) {
        BinaryTree * curent = node;
        BinaryTree * parent = node->pParrent;
        while (parent && curent == parent->pRight) {
            curent = parent;
            parent = parent->pParrent;
        }
        nextNode = parent;
    }
    return nextNode;
}

@end