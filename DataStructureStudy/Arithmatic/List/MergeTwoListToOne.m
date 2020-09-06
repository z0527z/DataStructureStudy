//
//  MergeTwoListToOne.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/9.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "MergeTwoListToOne.h"
#import "StructureDefine.h"

@implementation MergeTwoListToOne

- (instancetype)init
{
    if (self = [super init]) {
        
        // 构造链表1
        ListNode * head = malloc(sizeof(ListNode));
        head->value = 1;
        head->next = NULL;
        ListNode * p = head;
        for (int index = 1; index < 7; index += 2) {
            ListNode * temp = malloc(sizeof(ListNode));
            temp->value = index + 2;
            temp->next = NULL;
            p->next = temp;
            p = p->next;
        }
        
        ListNode * head2 = malloc(sizeof(ListNode));
        head2->value = 2;
        head2->next = NULL;
        ListNode * p2 = head2;
        for (int index = 2; index < 8; index += 2) {
            ListNode * temp = malloc(sizeof(ListNode));
            temp->value = index + 2;
            temp->next = NULL;
            p2->next = temp;
            p2 = p2->next;
        }
        
//        ListNode * list = noneRecursiveMergeTwoAscendingListInToAscendingOne(head, head2);
        ListNode * list = mergeTwoAscendingListIntoAscendingOne(head, head2);
        
        printf("\n--------- MergeTwoListToOne ---------\n\n");
        while (list) {
            printf("%d ", list->value);
            list = list->next;
        }
        printf("\n");
    }
    return self;
}

/**
 面试题25: 合并两个排序的链表
 
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 @param head1 递增链表1
 @param head2 递增链表2
 @return 合并的链表头结点
 */
ListNode * noneRecursiveMergeTwoAscendingListInToAscendingOne(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    ListNode * mergedHeader = NULL;
    ListNode * mergePtr = mergedHeader;
    ListNode ** temp = &p1;
    while (*temp) {
        int value1 = p1->value;
        int value2 = p2->value;
        temp = value1 < value2 ? &p1 : &p2;
        // 合并链表头结点为空时
        if (!mergedHeader) {
            mergedHeader = *temp;
            mergePtr = *temp;
        }
        else {
            // 合并链表头结点存在
            mergePtr->next = *temp;
            mergePtr = mergePtr->next;
        }
        // 取出节点的链表更新节点到下一个
        *temp = (*temp)->next;
    }
    // 如果链表1中有剩余的节点，则添加到合并链表来
    while (p1) {
        mergePtr->next = p1;
        mergePtr = mergePtr->next;
        p1 = p1->next;
    }
    
    // 如果链表2中有剩余的节点，则添加到合并链表来
    while (p2) {
        mergePtr->next = p2;
        mergePtr = mergePtr->next;
        p2 = p2->next;
    }
    
    return mergedHeader;
}

#pragma mark - 递归实现
ListNode * mergeTwoAscendingListIntoAscendingOne(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    
    ListNode * mergeListHead = NULL;
    
    if (head1->value < head2->value) {
        mergeListHead = head1;
        mergeListHead->next = mergeTwoAscendingListIntoAscendingOne(head1->next, head2);
    }
    else {
        mergeListHead = head2;
        mergeListHead->next = mergeTwoAscendingListIntoAscendingOne(head1, head2->next);
    }
    return mergeListHead;
}
@end
