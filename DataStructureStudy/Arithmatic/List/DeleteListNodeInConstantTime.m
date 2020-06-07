//
//  DeleteListNodeInConstantTime.m
//  MyStudy
//
//  Created by jolin on 2019/10/7.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DeleteListNodeInConstantTime.h"
#import "StructureDefine.h"

@implementation DeleteListNodeInConstantTime

- (instancetype)init
{
    if (self = [super init]) {
        
        // 构造链表
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        ListNode * p = head;
        ListNode * tobeDelete = head;
        for (int i = 0; i < 10; i ++) {
            ListNode * list = malloc(sizeof(ListNode));
            list->value = i + 2;
            list->next = NULL;
            p->next = list;
            p = p->next;
            if (i == 2) {
                tobeDelete = list;
            }
        }
        
        deleteListNode(&head, tobeDelete);
        
        printf("\n---- DeleteListNodeInConstantTime ---\n\n");
        p = head;
        while (p) {
            printf("%d ", p->value);
            p = p->next;
        }
        printf("\n");
        
        // 回收内存
        p = head;
        while (p) {
            ListNode * temp = p;
            p = p->next;
            free(temp);
        }
    }
    return self;
}

void deleteListNode(ListNode ** head, ListNode * toBeDeleted)
{
    if (head == NULL || *head == NULL || toBeDeleted == NULL) return;
    
    // 删除的节点不为尾节点
    if (toBeDeleted->next != NULL) {
        ListNode * toBeDeletedNext = toBeDeleted->next;
        toBeDeleted->value = toBeDeletedNext->value;
        toBeDeleted->next = toBeDeletedNext->next;
        free(toBeDeletedNext);
        toBeDeletedNext = NULL;
    }
    // 删除的节点为尾节点
    // 1、链表只有一个节点
    else if (*head == toBeDeleted) {
        free(toBeDeleted);
        toBeDeleted = NULL;
        *head = NULL;
    }
    // 链表中有多个节点时删除尾节点
    else {
        ListNode * p = *head;
        while (p->next && p->next != toBeDeleted) {
            p = p->next;
        }
        
        free(toBeDeleted);
        toBeDeleted = NULL;
        p->next = NULL;
    }
}

@end
