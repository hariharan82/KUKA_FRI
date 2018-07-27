cdef extern from "friClientApplication.h" namespace "FRI":
    cdef cppclass IClient:
    cdef cppclass TransformationClient:
    cdef cppclass IConnection:
    cdef cppclass ClientData:

    cdef cppclass ClientApplication:
        ClientApplication(IConnection, IClient)
        ClientApplication(IConnection , IClient , TransformationClient)
        bool connect(int, char)
        void disconnect()
        bool step()

        cdef IConnection *_connection          #!< connection interface
        cdef IClient *_robotClient         #!< robot client interface
        cdef TransformationClient *_trafoClient  #!< transformation client interface
        cdef ClientData *_data                #!< client data structure (for internal use)

cdef class PyClientApplication:
    cdef ClientApplication *thisptr
    def __cint__ (self, IConnection& connection, IClient& client)