class LogicGate:
    def __init__(self, n):
        self.name = n
        self.output = None

    def getName(self):
        return self.name

    def getOutput(self):
        self.output = self.performGateLogic()
        return self.output


class BinaryGate(LogicGate):
    def __init__(self, n):
        LogicGate.__init__(self, n)

        self.pinA = None
        self.pinB = None

    def getPinA(self):
        if self.pinA is None:
            return int(
                input('Enter Pin A input for gate ' + self.getName() + '--> ')
            )
        else:
            return self.pinA.getFrom().getOutput()

    def getPinB(self):
        if self.pinB is None:
            return int(
                input('Enter Pin B input for gate ' + self.getName() + '--> ')
            )
        else:
            return self.pinB.getFrom().getOutput()

    def setNextPin(self, source):
        if self.pinA is None:
            self.pinA = source
        else:
            if self.pinB is None:
                self.pinB = source
            else:
                raise RuntimeError(
                    'Cannot connect: NO EMPTY PINS on this gate.'
                )


class UnaryGate(LogicGate):
    def __init__(self, n):
        # These are all effectively the same:
        '''
        LogicGate.__init__(self, n)
        super(UnaryGate, self).__init__(n)
        '''
        super().__init__(n)

        self.pin = None

    def getPin(self):
        if self.pin is None:
            return int(
                input('Enter Pin input for gate ' + self.getName() + '--> ')
            )
        else:
            return self.pin.getFrom().getOutput()

    def setNextPin(self, source):
        if self.pin is None:
            self.pin = source
        else:
            print('Cannot connect: NO EMPTY PINS on this gate.')


# Binary gates:

class AndGate(BinaryGate):
    def __init__(self, n):
        super().__init__(n)

    def performGateLogic(self):
        a = self.getPinA()
        b = self.getPinB()

        return 1 if (a == 1 and b == 1) else 0


class OrGate(BinaryGate):
    def __init__(self, n):
        super().__init__(n)

    def performGateLogic(self):
        a = self.getPinA()
        b = self.getPinB()

        return 1 if (a == 1 or b == 1) else 0


class NandGate(AndGate):
    def performGateLogic(self):
        return 0 if super().performGateLogic() else 1


class NorGate(OrGate):
    def performGateLogic(self):
        return 0 if super().performGateLogic() else 1


# One or the other but not both:
class XorGate (BinaryGate):
    def __init__(self, n):
        super().__init__(n)

    def performGateLogic(self):
        a = self.getPinA()
        b = self.getPinB()

        return 1 if ((a == 1 and b == 0) or (a == 0 and b == 1)) else 0


# All opposites just invert the result of their parent.
class XnorGate(XorGate):
    def performGateLogic(self):
        return 0 if super.performGateLogic() else 1

# End of Binary gates.


# Unary gates:

class NotGate(UnaryGate):
    def __init__(self, n):
        super().__init__(n)

    def performGateLogic(self):
        return 0 if self.getPin() else 1


# End of Unary gates.

class Connector:
    def __init__(self, fgate, tgate):
        self.fromgate = fgate
        self.togate = tgate

        tgate.setNextPin(self)

    def getFrom(self):
        return self.fromgate

    def getTo(self):
        return self.togate

'''
def main ():
    g1 = AndGate('G1')
    g2 = AndGate('G2')
    g3 = OrGate('G3')
    g4 = NotGate('G4')
    c1 = Connector(g1, g3)
    c2 = Connector(g2, g3)
    c3 = Connector(g3, g4)
    print(g4.getOutput())
'''


def main():
    g1 = AndGate('G1')
    g2 = OrGate('G2')
    c1 = Connector(g1, g2)
    print(g2.getOutput())

main()
