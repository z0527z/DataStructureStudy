//
//  FindFirstCommonNode.m
//  MyStudy
//
//  Created by jolin.ding on 2019/11/4.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "FindFirstCommonNode.h"
#import "StructureDefine.h"

@implementation FindFirstCommonNode

- (instancetype)init
{
    if (self = [super init]) {
        
        ListNode * head1 = malloc(sizeof(ListNode));
        head1->value = 1;
        
        ListNode * node1 = malloc(sizeof(ListNode));
        node1->value = 2;
        head1->next = node1;
        
        ListNode * node2 = malloc(sizeof(ListNode));
        node2->value = 3;
        node1->next = node2;
        
        ListNode * node3 = malloc(sizeof(ListNode));
        node3->value = 4;
        node2->next = node3;
        
        ListNode * node4 = malloc(sizeof(ListNode));
        node4->value = 5;
        node3->next = node4;
        
        node4->next = NULL;
        
        // list 2
        ListNode * head2 = malloc(sizeof(ListNode));
        head2->value = -2;
        
        ListNode * temp1 = malloc(sizeof(ListNode));
        temp1->value = -1;
        head2->next = temp1;
        
        ListNode * temp2 = malloc(sizeof(ListNode));
        temp2->value = 0;
        temp1->next = temp2;
        
        temp2->next = node2;
        
        ListNode * firstCommonNode = findFirstCommonNodeInTwoList(head1, head2);
        printf("\n------------- FindFirstCommonNode -----------\n\n");
        printf("%d\n", firstCommonNode->value);
        
    }
    return self;
}


/// 面试题: 求链表公共节点
///
/// 输入两个链表，找出它们的第一个公共节点
///
/// @param head1 链表1的头节点
/// @param head2 链表2的头节点
ListNode * findFirstCommonNodeInTwoList(ListNode * head1, ListNode * head2)
{
    if (!head1 || !head2) return NULL;
    
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    
    while (p1 != p2) {
        p1 = !p1 ? head2 : p1->next;
        p2 = !p2 ? head1 : p2->next;
    }
    return p1;
}

@end
