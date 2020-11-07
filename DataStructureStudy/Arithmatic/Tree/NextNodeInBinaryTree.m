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
        
        /*
                1
              /   \
             2     6
            / \   /
           3   4 7
         
         */
        
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
        right6->pRight = NULL;
        
        BinaryTree * left7 = malloc(sizeof(BinaryTree));
        left7->value = 7;
        left7->pParrent = right6;
        left7->pLeft = NULL;
        left7->pRight = NULL;
        
        right6->pLeft = left7;
        
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
        
        BinaryTree * nextNodeInInOrder = nextNodeInInOrderBinaryTreeTraverse(left1);
        BinaryTree * nextNodeInPreOrder = nextNodeInPreOrderBinaryTreeTraverse(left7);
        BinaryTree * nextNodeInPostOrder = nextNodeInPostOrderBinaryTreeTraverse(left1);
        
        printf("\n-------- NextNodeInBinaryTree --------\n\n");
        nextNodeInInOrder ? printf("%d, ", nextNodeInInOrder->value) : printf("NULL, ");
        nextNodeInPreOrder ? printf("%d, ", nextNodeInPreOrder->value) : printf("NULL, ");
        nextNodeInPostOrder ? printf("%d", nextNodeInPostOrder->value) : printf("NULL");
        printf("\n");
        
    }
    return self;
}


/// 找寻传入节点在中序遍历中的下一个节点
/// @param node 传入节点
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


/// 找寻传入节点在前序遍历中的下一个节点
/// @param node 传入节点
BinaryTree * nextNodeInPreOrderBinaryTreeTraverse(BinaryTree * node)
{
    if (!node) return NULL;
    
    BinaryTree * nextNode = NULL;
    if (node->pLeft) {
        nextNode = node->pLeft;
    }
    else if (node->pRight) {
        nextNode = node->pRight;
    }
    else if (node->pParrent) {
        BinaryTree * current = node;
        BinaryTree * parent = node->pParrent;
        while (parent && (parent->pRight == current || parent->pRight == NULL)) {
            current = parent;
            parent = parent->pParrent;
        }
        nextNode = parent ? parent->pRight : NULL;
    }
    
    return nextNode;
}


/// 找寻传入节点在后续遍历中的下一个节点
/// @param node 传入的节点
BinaryTree * nextNodeInPostOrderBinaryTreeTraverse(BinaryTree * node)
{
    if (!node) return NULL;
    
    BinaryTree * nextNode = NULL;
    if (node->pParrent) {
        BinaryTree * current = node;
        BinaryTree * parent = node->pParrent;
        if (parent->pRight && parent->pRight != current) {
            nextNode = parent->pRight;
        }
        else {
            nextNode = parent;
        }
    }
    return nextNode;
}

@end
