import UIKit

// Overring
// 关键字 override
/*
 1.A subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass. This is known as overriding.
 */

// Overriding Property Getters and Setters

/*
 2.You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You can’t, however, present an inherited read-write property as a read-only property.
 */

/*
 3.You can’t add property observers to inherited constant stored properties or inherited read-only computed properties.
 */

/*
 4.Note also that you can’t provide both an overriding setter and an overriding property observer for the same property. If you want to observe changes to a property’s value, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter.
 */

// Preventing Overrides

/*
 5.You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
 */

/*
 6.You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class).
 */
