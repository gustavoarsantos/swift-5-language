//: [Previous](@previous)
//: ## Access Control
//: >Você pode especificar niveis de acesso para seus tipos (classes, structures, and enumerations), assim como properties, initializers, methods que pertencem a essas classes.

//: Modules and Source Files
// Modulos são um pacote de distribuição - como um framework ou aplicação.

//: Access Levels
// Default Access level - Internal

// Open & Public: Pode ser usado em qualquer lugar dentro e fora do modulo.
// Internal     : Acessível em qualquer lugar apenas dentro do modulo.
// Fileprivate  : Acessível apenas no mesmo arquivo em que foi escrito
// Private      : Acessivel apenas no contexto da declaração, e em extension no mesmo arquivo


// Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePriviateFunction() {}

class SomeImplicitlyInternalClass {}        // implicitly internal
let someImplicitlyInternalConstant = 0      // implicitly internal


public class AnotherPublicClass {           // explicitly public class
    public var somePublicProperty = 0       // explicitly public class member
    var someInternalProperty = 0            // implicitly internal class member
    private func somePrivateMethod() {}     // explicitly private class member
}

class AnotherInternalClass {                // implicitly internal class
    var someInternalProperty = 0            // implicitly internal class member
    private func somePrivateMethod() {}     // explicitly private class member
}

fileprivate class AnotherFilePrivateClass { // explicitly file-private class
    func someFilePrivateMethod() {}         // inplicitly file-private method
    private func somePrivateMethod() {}     // explicitly file-private method
}

private class AnotherPrivateClass {         // explicitly private class
    var somePrivateProperty = 0             // implicitly private class member
    func somePrivateMethod() {}             // implicitly private class member
}

// Subclasses
// Subclass não podem ter um nivel de acesso maior que a super class
// Override pode aumentar o nivel de acesso
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}



public class C {
    fileprivate func someMethod() {}
}
internal class D: C {
    override internal func someMethod() {
        super.someMethod()
    }
}

//Propriedades podem ter o nível de acesso do setter menor que o do getter
struct E {
    private(set) fileprivate var privateSet: String = "private set property"
    internal(set) public var internalSet: String = "internal set property"
}

var e = E()
//e.privateSet = "Não consigo pois é privado"
//Erro, pois o setter é privado
print(e.privateSet)

e.internalSet = "Consigo pois é internal"
print(e.internalSet)


//: [Codable](@next)

