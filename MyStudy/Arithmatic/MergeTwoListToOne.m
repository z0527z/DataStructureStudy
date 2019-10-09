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
        
        ListNode * list = mergeTwoAscendingListToAscendingOne(head, head2);
        
        printf("\n------- MergeTwoListToOne -------\n\n");
        while (list) {
            printf("%d ", list->value);
            list = list->next;
        }
        printf("\n");
    }
    return self;
}

ListNode * mergeTwoAscendingListToAscendingOne(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    ListNode * mergedHeader = NULL;
    ListNode * mergePtr = mergedHeader;
    while (p1 && p2) {
        
        int value1 = p1->value;
        int value2 = p2->value;
        if (value1 < value2) {
            if (!mergedHeader) {
                mergedHeader = p1;
                mergePtr = p1;
            }
            else {
                mergePtr->next = p1;
                mergePtr = mergePtr->next;
            }
            p1 = p1->next;
        }
        else {
            if (!mergedHeader) {
                mergedHeader = p2;
                mergePtr = p2;
            }
            else {
                mergePtr->next = p2;
                mergePtr = mergePtr->next;
            }
            p2 = p2->next;
        }
    }
    
    while (p1) {
        mergePtr->next = p1;
        mergePtr = mergePtr->next;
        p1 = p1->next;
    }
    
    while (p2) {
        mergePtr->next = p2;
        mergePtr = mergePtr->next;
        p2 = p2->next;
    }
    
    return mergedHeader;
}

@end
