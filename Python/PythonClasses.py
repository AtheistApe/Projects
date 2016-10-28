class ContactList(list):

    def search(self, name):
        """Return all contacts that contain the search value in their name."""
        matching_contacts = []
        for contact in self:
            if name in contact.name:
                matching_contacts.append(contact)
        return matching_contacts


class Contact(object):

    """A simple class construction"""
    all_contacts = ContactList()

    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.all_contacts.append(self)

    def print_contacts(self):
        for contact in self.all_contacts:
            print(contact.name)


class Supplier(Contact):

    def order(self, order):
        print("If this were a real system we would send {} order to {}".format(
            order, self.name))


class Friend(Contact):

    def __init__(self, name, email, phone):
        super().__init__(name, email)
        self.phone = phone


gary = Contact("Gary Church", "gary.church1@comcast.net")
aaryn = Contact("Aaryn Church", "aarync@juno.com")
connor = Contact("Connor Church", "cd_church@comcast.net")
john = Supplier("John Folk", "jfolk@yahoo.com")
jay = Friend("Jay Lehmann", "lehmannj@smccd.edu", "650-574-6621")

print(jay.name)
print(jay.email)
print(jay.phone)

print(gary.name)
print(gary.email)

print(aaryn.name)
print(aaryn.email)

john.order("pizza")

# john.print_contacts()
# [contact.print_contacts() for contact in john.all_contacts.search("ary")]
# [contact.print_contacts() for contact in gary.all_contacts]
