#!/usr/bin/python2.5
import sys
from AddressBook import *
def GetAllABGroups(abref):
  groupdict = {}
  abgroups = abref.groups()
  for abgroup in abgroups:
    groupdict[abgroup.name()] = [abgroup.uniqueId()]
  return groupdict
def GetAllABListEmails(abref, abgroupid):
  address_dict = {}
  abgroup = abref.recordForUniqueId_(abgroupid)
  card = abgroup.members()
  for entity in card:
    emails = entity.valueForProperty_(kABEmailProperty)
    if emails is not None:
      address_dict[entity.uniqueId()] = emails.valueAtIndex_(0)
  return address_dict
def main():
  ab = ABAddressBook.sharedAddressBook()
  groups = GetAllABGroups(ab)
  print groups
  groupid = None
  for group in groups:
    if group == "Math120S16":
      groupid = groups[group][0]
      break
  if groupid is None:
    print "Group not found"
    sys.exit(1)
  addresses = GetAllABListEmails(ab, groupid)
  for i in addresses:
    print addresses[i] + ",",
if __name__ == '__main__':
  main()