from datetime import datetime, timedelta
import unittest
from gareth53_v2.apps.lifestream.utils import group_items

class ItemMock(object):
    
    def __init__(self, pub_date, source):
        self.pub_date = pub_date
        self.feed = source


class UtilsTest(unittest.TestCase):

    def setUp(self):
        # build an input list
        self.sources = ["Source1", "Source2", "Source3"]
        
        input_list = []
        hourdiff = 4
        items = 20
        now = datetime.now() - timedelta(hours=items * hourdiff)
        for i in range(1, items):
            input_list.append(ItemMock(
                pub_date=now + timedelta(hours=i*hourdiff),
                source=self.sources[i % len(self.sources)]
            ))
        self.input_list = input_list
        self.output = group_items(input_list)


    def test_date_group(self):
        # assert that we have groups in proper date order - newest first
        last_date = datetime.now() + timedelta(hours=1)
        for group in self.output:
            assert(group['date'] < last_date)
            last_date = group['date']


    def test_source_groups_exist(self):
        # assert that groups have source groups
        for day in self.output:
            for key in day['sources']:
                assert key['source'] in self.sources


    def test_all_items_exist(self):
        # assert that we have the right number of items in total
        item_count = 0
        for day in self.output:
            for source in day['sources']:
                item_count += len(source['items'])

        assert (item_count == len(self.input_list))

