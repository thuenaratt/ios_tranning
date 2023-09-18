import Foundation

// 1. MARK: - Constants & Variables ✅
/*
 - Constant and variable name support unicode character.
 - Name can't contain whitespase characters
 */
// 📍 String ✅

//let dog: String = "Hello world!"
//print(dog)
//let value: Int = 12 // defalue system 32 or 64
//var name = "dara"
//print(name)
//name = "Sok"
//print(name)

/*
 - Swift have Sign and Unsign integer (Int or UInt)
 - Custom allocate size in memory (Int8: 8-bit, UInt8: 8-bit, Int16: 16-bit)
 - If we say var age: Int
	-> System structuer 32-bits will allocate 32-bits (Based on system structure)
 */
// 📍 Integer ✅

//let intValue: Int = 34
//let int8: Int16 = 500

/*
 Floating-point numbers are numbers with a fractional component
 */
// 📍 Floating-Point Number (Float: 32-bit, Double: 64-bit) ✅

//var floatValue: Float = 12
//var name = "Dara"
//var a = 12
//var b = 12.0
//let doubleValue: Double = 12.12

// 📍 Boolean ✅

//var bol: Bool = true
//var bol2 =  false


/*
 Type aliases to define an alternative name for an existing type.
 You define type aliases with the "typealias" keyword.
 */
//  📍 Type Aliases ✅

//typealias Balance = Double
//
//var balance: Balance = 12.0


/*
 Tuples group multiple values into a single compound value.
 The values within a tuple can be of any type and don’t have to be of the same type as each other.
*/
// 📍 Tuples ✅

//let httpsCode = (code: 200, status: "Success")
//print(httpsCode.code)
//print(httpsCode.status)
//
//func maxMin() -> (max: Int, min: Int) {
//	return (34, 0)
//}

/*
 We use optionals in situations where a value may be absent.
 */
// 📍 Optionals ✅

//var optionalValue: String? // = nil
//
//optionalValue = "SOK"
//
//print(optionalValue ?? "Dara") // Provide default value
//
//var option2: Int?
//
//option2 = 20
//print(option2!) // Force unrap


/*
 We can use optional binding to check optional value.
 It can use in "if" and "while"
 */
// 📍 Optionals Binding  ✅
//var value = Int("12")
//
//if value != nil {
//	print(value!)
//}

if let value = Int("ws") {
	// value availble in this block
	print(value)
}else {
	print("Can't case")
}


// Collections -> (Array, Dictionary, Set)
/*
 An array stores values of the same type in an ordered list.
 Ex: [0, 1, 2, 3, 4]
 */
// 📍 Array

/*
 A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
 Ex: ["one": 1, "two": 2, "three": 3]
 */
// 📍 Dictionary

// 2. MARK: - Control Flow

// 📍 For Loops

// 📍 While Loops

// 📍 Repeat - While

// 📍 If else

// 📍 Switch

/*
   📍 Control Transfer Statements
    => continue, break, return, throw, fallthrough
 */

// 📍 Early Exist (guard - let)

// 3. MARK: - Functions

// 📍 Sample

/*
 We can use a tuple type as the return type for a function to return multiple values as part of one compound return value.
 */
// 📍 Multiple Return

// 📍 Agument
/*
 If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.
 */
// 📍 Omitting agument

/*
 Provide default value to parameter
 */
// 📍 Default parameters

// 4. MARK: - ...
// 📍 Enumeration

// 📍 Structure (Value types)

// 📍 Class (Reference types)

// 5. MARK: - Properties
// 📍 Stored

/*
 Allocate on first access only
 */
// 📍 Lazy Stored

// 📍 Computed (getter, setter)

/*
 Observe and respond to changes in a property's value.
 Are called every time a property's value is set, event if the same value.
 (willSet, didSet)
 - willSet: is called just before the value is stored
 - didSet: is called immediately after the new value is stored
 */
// 📍 Property Observers

// 5. MARK: - Methods
// 📍 Methods

/*
 Mutating is mark a mothod that modify the structure property.
 In class no need mutating because class methods always can modify the class.
 */
// 📍 Mutating

// MARK: - 5 Access Levels
// 📍 Open & public : Allow access from any source file in defining module and from other module.

// 📍 Internal: is default access level. Can access only defining module.

/*
 - Allow access in the same file.
 - Other file can't access
 */
// 📍 File-private
struct Cat {
	private var name: String = "Mew"
	fileprivate var age: Int = 1
}

struct Dog {
	private var cat = Cat()
	
	private func read() {
		print(cat.age)
	}
}
// 📍 Private: Protected access

// 6. MARK: - Inheritance
// 📍 Inheritance

// MARK: - Extensions
// 📍 Extensions

// 7. MARK: - Others
// 📍 Protocol

// 📍 Delegation

// 📍 Generics

// 📍 Error Handling
