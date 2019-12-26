//
//  RemoveRepeatListNode.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/12.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "RemoveRepeatListNode.h"
#import "StructureDefine.h"

@implementation RemoveRepeatListNode

- (instancetype)init
{
    if (self = [super init]) {
        
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        
        ListNode * p = malloc(sizeof(ListNode));
        p->value = 2;
        p->next = NULL;
        head->next = p;
        
        ListNode * p1 = malloc(sizeof(ListNode));
        p1->value = 2;
        p1->next = NULL;
        p->next = p1;
        
        
        ListNode * p2 = malloc(sizeof(ListNode));
        p2->value = 2;
        p2->next = NULL;
        p1->next = p2;
        
        ListNode * p3 = malloc(sizeof(ListNode));
        p3->value = 3;
        p3->next = NULL;
        p2->next = p3;
        
        ListNode * p4 = malloc(sizeof(ListNode));
        p4->value = 3;
        p4->next = NULL;
        p3->next = p4;
        
        ListNode * p5 = malloc(sizeof(ListNode));
        p5->value = 3;
        p5->next = NULL;
        p4->next = p5;
        
        removeAllRepeatListNode(&head);
//        keepOneOnRepeatListNode(head);
        printf("\n------------ RemoveRepeatListNode ----------\n\n");
        while (head) {
            printf("%d ", head->value);
            head = head->next;
        }
        printf("\n");
    }
    return self;
}

/// 给定一个有序链表，删除其中所有重复元素
/// @param head 指向输入的链表头结点的指针
void removeAllRepeatListNode(ListNode ** head)
{
    if (!head || *head == NULL) return;

    ListNode * prev = NULL;
    ListNode * p1 = *head;

    while (p1) {
        ListNode * p2 = p1->next;
        bool needDelete = false;
        // 检测是否需要删除节点
        if (p2 && p1->value == p2->value) {
            needDelete = true;
        }
        // 不需要删除
        if (!needDelete) {
            prev = p1;
            p1 = p1->next;
        }
        else {
            // 需要删除时，先存储 p1 的值，因为 toBeDel 指向了 p1, p1对应的空间会被释放
            int value = p1->value;
            ListNode * toBeDel = p1;
            while (toBeDel && toBeDel->value == value) {
                p2 = toBeDel->next;
                free(toBeDel);
                toBeDel = NULL;
                toBeDel = p2;
            }
        }
        if (!prev) {
            *head = p2;
        }
        else {
            prev->next = p2;
        }
        p1 = p2;
    }
}


/// 给定一个有序链表，删除其中重复元素，仅剩下一个。
/// @param head 输入的链表头结点
void keepOneOnRepeatListNode(ListNode * head)
{
    if (!head || head->next == NULL) return;
    
    ListNode * p = head;
    ListNode * p1 = p->next;
    while (p1) {
        if (p->value == p1->value) {
            p->next = NULL;
            ListNode * toBeDel = p1;
            p1 = p1->next;
            free(toBeDel);
            toBeDel = NULL;
        }
        else {
            p->next = p1;
            p = p->next;
            p1 = p1->next;
        }
    }
}


@end
