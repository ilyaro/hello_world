import unittest
from hello import hello


class primetest(unittest.TestCase):
	def test_hello(self):
		self.assertEqual(hello(), "Hello World", 'checking psge output')
		
if __name__ == '__main__':
	unittest.main()