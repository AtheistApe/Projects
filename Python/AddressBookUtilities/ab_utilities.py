import AddressBook as ab
import pprint as pp
# import config

address_book = ab.ABAddressBook.sharedAddressBook()

def dedupe_list(list_passed):
    '''
    given a list (of tuples) remove duplicates
    John smith and John Smith are duplicates
    we are using the *first item* in the tuple passed to
    look at duplication
    :param list_passed:
    :return:
    '''
    list_to_return = []
    list_passed_lower = [x[0].lower() for x in list_passed]
    for x_index, x in enumerate(list_passed_lower):
        if list_passed_lower.count(x) == 1:
            list_to_return.append(list_passed[x_index])
    return list_to_return

def get_unique_group_members(group_name = None):
    '''
    The purpose of this functin is to return a sorted list of either
    'all unique group members' if the group name is passed
    or
    'all unique address book members' if no group name is passed in.

    If the person has no first name and/or no last name they are excluded

    Duplicates are not returned

    Each member of the list is a tuple in the following form:
    'First Name' space 'Last Name', UID

    To get all members of the Clinic Clients group:
    python ab_utilities.py get_unique_group_members -group_name='Clinic Clients'

    To get all members of the Address Book:
    python ab_utilities.py get_unique_group_members
    :param group_name:
    :return:
    '''
    list_to_return = []

    if group_name is None:
        for person in address_book.people():
            first_name = person.valueForProperty_('First')
            last_name = person.valueForProperty_('Last')
            person_id = person.valueForProperty_('UID')
            if not (first_name is None or last_name is None):
                list_to_return.append(
                    (first_name.strip() + " " + last_name.strip(), person_id)
                )
    else:
        is_group_found = False
        groups = address_book.groups()
        for group in groups:
            if group.valueForProperty_('GroupName') == group_name:
                is_group_found = True
                break
        if not is_group_found:
            return False
        else:
            if len(group.members()) == 0:
                # the group is empty
                return list_to_return # an empty list
            for member in group.members():
                first_name = member.valueForProperty_('First')
                last_name = member.valueForProperty_('Last')
                person_id = member.valueForProperty_('UID')
                if not (first_name is None or last_name is None):
                    list_to_return.append(
                        (first_name.strip() + " " + last_name.strip(), person_id)
                    )

    return sorted(dedupe_list(list_to_return))

def add_person_to_group(group_name, user_id):
    '''
    This function adds the person to the group
    return False if the group is not found
    return False if the person not found in the address book
    return None if the person already in the group
    return True if the person is successfully added
    :param group_name:
    :param user_id:
    :return:
    '''

    groups = address_book.groups()
    is_group_found = False
    for group in groups:
        if group.valueForProperty_('GroupName') == 'group_name':
            is_group_found = True
            break

    if is_group_found:
        is_user_found = False
        for person in address_book.people():
            if person.valueForProperty_('UID') == user_id:
                is_user_found = True
                break
    else:
        # group not found
        return False

    if is_user_found:
        # check to see if they are already in the group or not
        if user_id in [x[1] for x in get_unique_group_members(group_name)]:
            # person already exists in group
            return None
        else:
            group.addMember_(person)
            address_book.save()
    else:
        # user not found
        return False

    return True

if __name__ == '__main__':

    print get_unique_group_members()
