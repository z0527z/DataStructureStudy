//
//  No2_addTwoNumbers.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/19.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No2_addTwoNumbers.h"
#import "StructureDefine.h"

@implementation No2_addTwoNumbers

- (instancetype)init
{
    if (self = [super init]) {
        ListNode * head1 = malloc(sizeof(ListNode));
        head1->value = 2;
        
        ListNode * second1 = malloc(sizeof(ListNode));
        second1->value = 4;
        head1->next = second1;
        
        ListNode * third1 = malloc(sizeof(ListNode *))
        
        ListNode * head2 = malloc(sizeof(ListNode));
    }
    return self;
}

ListNode * 

ListNode * addTwoNumbers(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    ListNode ** result = NULL;
    ListNode * p3 = NULL;
    int carry = 0;
    
    while (p1 && p2) {
        int value1 = p1->value;
        int value2 = p2->value;
        int sum = value1 + value2 + carry;
        if (sum > 10) {
            carry = 1;
            sum /= 10;
        }
        ListNode * node = malloc(sizeof(ListNode));
        node->value = sum;
        node->next = NULL;
        if (*result == NULL) {
            *result = node;
            p3 = node;
        }
        else {
            p3->next = node;
            p3 = p3->next;
        }
        p1 = p1->next;
        p2 = p2->next;
    }
    return *result;
}

@end
