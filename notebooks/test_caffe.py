import caffe
net = caffe.Net('data/lenet.prototxt', caffe.TRAIN)
solver = caffe.SGDSolver('data/lenet_solver.prototxt')