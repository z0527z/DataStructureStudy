//
//  OutputKthNodeToTail.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/8.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "OutputKthNodeToTail.h"
#import "StructureDefine.h"

@implementation OutputKthNodeToTail

- (instancetype)init
{
    if (self = [super init]) {
        // 构造链表
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        ListNode * p = head;
        for (int i = 0; i < 10; i ++) {
            ListNode * list = malloc(sizeof(ListNode));
            list->value = i + 2;
            list->next = NULL;
            p->next = list;
            p = p->next;
        }
        
        int k = 5;
        ListNode * kthNode = findKthNodeToTail(head, k);
        
        printf("\n------- OutputKthNodeToTail -------\n\n");
        p = head;
        while (p) {
            printf("%d ", p->value);
            p = p->next;
        }
        
        if (kthNode) {
            printf("\n\n%dth :=> %d", k, kthNode->value);
        }
        printf("\n");
    }
    return self;
}

ListNode * findKthNodeToTail(ListNode * head, int k)
{
    if (!head || k < 1) return NULL;
    
    ListNode * p1 = head;
    ListNode * p2 = head;
    
    for (int i = 0; i < k - 1; i ++) {
        // 检测链表的节点数，小于 k 个则，返回 NULL
        if (p1->next) {
            p1 = p1->next;
        }
        else {
            return NULL;
        }
    }
    
    while (p1->next) {
        p1 = p1->next;
        p2 = p2->next;
    }
    
    return p2;
}

@end
