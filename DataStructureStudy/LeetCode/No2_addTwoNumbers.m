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
        int array1[] = {2, 4, 7, 9};
        int size = sizeof(array1) / sizeof(array1[0]);
        ListNode * head1 = constructList(array1, size);
        
        int array2[] = {5, 6, 4};
        size = sizeof(array2) / sizeof(array2[0]);
        ListNode * head2 = constructList(array2, size);
        
        ListNode * sum = addTwoNumbers(head1, head2);
        printf("\n------------- No2_addTwoNumbers ------------\n\n");
        printf("sum: ");
        while (sum) {
            printf("%d -> ", sum->value);
            sum = sum->next;
        }
        printf("NULL\n");
    }
    return self;
}

ListNode * addTwoNumbers(ListNode * head1, ListNode * head2)
{
    if (!head1) return head2;
    if (!head2) return head1;
    ListNode * p1 = head1;
    ListNode * p2 = head2;
    ListNode * result = NULL;
    ListNode * p3 = NULL;
    int carry = 0;
    
    while (p1 || p2) {
        int value1 = p1 ? p1->value : 0;
        int value2 = p2 ? p2->value : 0;
        int sum = value1 + value2 + carry;
        if (sum >= 10) {
            carry = 1;
            sum %= 10;
        }
        else {
            carry = 0;
        }
        ListNode * node = nodeFromValue(sum);
        if (!result) {
            result = node;
            p3 = node;
        }
        else {
            p3->next = node;
            p3 = p3->next;
        }
        p1 ? p1 = p1->next : 0;
        p2 ? p2 = p2->next : 0;
    }
    if (carry > 0) {
        ListNode * node = nodeFromValue(carry);
        p3->next = node;
    }
    
    return result;
}

@end
