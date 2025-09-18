//
//  ContentView.swift
//  SwiftfulHapticsExample
//
//  Created by Nick Sarno on 5/19/24.
//

import SwiftUI
import SwiftfulHaptics

private struct HapticManagerKey: EnvironmentKey {
    static let defaultValue: HapticManager = HapticManager()
}

extension EnvironmentValues {
    var haptics: HapticManager {
        get { self[HapticManagerKey.self] }
        set { self[HapticManagerKey.self] = newValue }
    }
}

struct HapticButton {
    let title: String
    let subtitle: String
    let hapticOption: HapticOption
}

struct HapticCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let count: Int
    let buttons: [HapticButton]
}

struct ContentView: View {
    @Environment(\.haptics) var haptics
    @State private var searchText = ""
    
    let categories: [HapticCategory] = [
        HapticCategory(
            name: "Basic Haptics",
            icon: "waveform",
            description: "Standard iOS feedback patterns",
            count: 9,
            buttons: [
                HapticButton(title: "Selection", subtitle: "Selection feedback", hapticOption: .basic(.selection)),
                HapticButton(title: "Light Impact", subtitle: "Gentle tap", hapticOption: .basic(.light)),
                HapticButton(title: "Medium Impact", subtitle: "Standard tap", hapticOption: .basic(.medium)),
                HapticButton(title: "Heavy Impact", subtitle: "Strong tap", hapticOption: .basic(.heavy)),
                HapticButton(title: "Soft Impact", subtitle: "Subtle tap", hapticOption: .basic(.soft)),
                HapticButton(title: "Rigid Impact", subtitle: "Firm tap", hapticOption: .basic(.rigid)),
                HapticButton(title: "Success", subtitle: "Notification success", hapticOption: .basic(.success)),
                HapticButton(title: "Warning", subtitle: "Notification warning", hapticOption: .basic(.warning)),
                HapticButton(title: "Error", subtitle: "Notification error", hapticOption: .basic(.error)),
            ]
        ),
        
        HapticCategory(
            name: "Gaming Effects",
            icon: "gamecontroller",
            description: "Combat, magic, and action game haptics",
            count: 22,
            buttons: [
                // Lightning
                HapticButton(title: "Lightning Strike - Quick", subtitle: "Sharp electric zap", hapticOption: .gaming(.lightningStrikeQuick())),
                HapticButton(title: "Lightning Strike - Chain", subtitle: "Multiple electric pulses", hapticOption: .gaming(.lightningStrikeChain())),
                HapticButton(title: "Lightning Strike - Heavy", subtitle: "Massive electric blast", hapticOption: .gaming(.lightningStrikeHeavy())),
                // Coins
                HapticButton(title: "Coin Collection - Single", subtitle: "Metallic ping", hapticOption: .gaming(.coinCollectSingle())),
                HapticButton(title: "Coin Collection - Multi", subtitle: "Rapid coin succession", hapticOption: .gaming(.coinCollectMulti())),
                HapticButton(title: "Coin Collection - Jackpot", subtitle: "Building celebration", hapticOption: .gaming(.coinCollectJackpot())),
                // Combat
                HapticButton(title: "Sword Slash - Light", subtitle: "Quick cutting motion", hapticOption: .gaming(.swordSlashLight())),
                HapticButton(title: "Sword Slash - Heavy", subtitle: "Powerful swing with weight", hapticOption: .gaming(.swordSlashHeavy())),
                HapticButton(title: "Arrow Release", subtitle: "Tension release with twang", hapticOption: .gaming(.arrowRelease())),
                HapticButton(title: "Shield Block", subtitle: "Impact absorbed with reverb", hapticOption: .gaming(.shieldBlock())),
                HapticButton(title: "Critical Hit", subtitle: "Double pulse with emphasis", hapticOption: .gaming(.criticalHit())),
                // Explosions
                HapticButton(title: "Explosion - Small", subtitle: "Quick burst", hapticOption: .gaming(.explosionSmall())),
                HapticButton(title: "Explosion - Massive", subtitle: "Building explosion with shockwave", hapticOption: .gaming(.explosionMassive())),
                // Combos
                HapticButton(title: "Combo Hit - 3x", subtitle: "Three escalating hits", hapticOption: .gaming(.comboHit3x())),
                HapticButton(title: "Combo Hit - 5x", subtitle: "Five rapid hits with finish", hapticOption: .gaming(.comboHit5x())),
                // Movement
                HapticButton(title: "Footstep - Grass", subtitle: "Soft, muffled step", hapticOption: .gaming(.footstepGrass())),
                HapticButton(title: "Footstep - Metal", subtitle: "Hard, clanking step", hapticOption: .gaming(.footstepMetal())),
                HapticButton(title: "Engine Start", subtitle: "Ignition with engine rumble", hapticOption: .gaming(.engineStart())),
                HapticButton(title: "Turbo Boost", subtitle: "Acceleration surge", hapticOption: .gaming(.turboBoost())),
                // Other
                HapticButton(title: "Machine Gun", subtitle: "Rapid-fire pulses", hapticOption: .gaming(.machineGun())),
                HapticButton(title: "Magic Charge", subtitle: "Building magical energy", hapticOption: .gaming(.magicCharge())),
                HapticButton(title: "Portal Enter", subtitle: "Warping sensation", hapticOption: .gaming(.portalEnter())),
                HapticButton(title: "Drums", subtitle: "Complex drum pattern", hapticOption: .gaming(.drums)),
            ]
        ),
        
        HapticCategory(
            name: "Educational",
            icon: "star.fill",
            description: "Learning achievements and feedback",
            count: 30,
            buttons: [
                // Achievements
                HapticButton(title: "Achievement Unlocked", subtitle: "Major accomplishment", hapticOption: .educational(.achievementUnlocked())),
                HapticButton(title: "Level Up", subtitle: "Energy burst celebration", hapticOption: .educational(.levelUp())),
                HapticButton(title: "Star Rating", subtitle: "3-star rating", hapticOption: .educational(.starRating())),
                HapticButton(title: "Badge Earned", subtitle: "Medal achievement", hapticOption: .educational(.badgeEarned())),
                HapticButton(title: "Streak Milestone", subtitle: "Streak celebration", hapticOption: .educational(.streakMilestone())),
                HapticButton(title: "Perfect Score", subtitle: "Flawless performance", hapticOption: .educational(.perfectScore())),
                HapticButton(title: "Rank Promotion", subtitle: "Level advancement", hapticOption: .educational(.rankPromotion())),
                HapticButton(title: "Daily Goal Complete", subtitle: "Daily target achieved", hapticOption: .educational(.dailyGoalComplete())),
                HapticButton(title: "Trophy Unlock", subtitle: "Trophy achievement", hapticOption: .educational(.trophyUnlock())),
                HapticButton(title: "Quest Complete", subtitle: "Mission accomplished", hapticOption: .educational(.questComplete())),
                HapticButton(title: "High Score", subtitle: "New personal best", hapticOption: .educational(.highScore())),
                HapticButton(title: "Mastery Achieved", subtitle: "Skill mastered", hapticOption: .educational(.masteryAchieved())),
                // Learning Feedback
                HapticButton(title: "Correct Answer", subtitle: "Light confirmation tap", hapticOption: .educational(.correctAnswer())),
                HapticButton(title: "Incorrect Answer - Gentle", subtitle: "Soft buzz for kids", hapticOption: .educational(.incorrectGentle())),
                HapticButton(title: "Hint Available", subtitle: "Subtle guidance pulse", hapticOption: .educational(.hintAvailable())),
            ]
        ),
        
        HapticCategory(
            name: "UI Interaction",
            icon: "hand.tap",
            description: "User interface and interaction patterns",
            count: 35,
            buttons: [
                HapticButton(title: "Double Tap Like", subtitle: "Quick double pulse", hapticOption: .uiInteraction(.doubleTapLike())),
                HapticButton(title: "Message Sent", subtitle: "Swoosh with fade", hapticOption: .uiInteraction(.messageSent())),
                HapticButton(title: "Notification Pop", subtitle: "Attention-grabbing pop", hapticOption: .uiInteraction(.notificationPop())),
                HapticButton(title: "Pull to Refresh", subtitle: "Elastic tension release", hapticOption: .uiInteraction(.pullToRefresh())),
                HapticButton(title: "Swipe Action", subtitle: "Progressive feedback", hapticOption: .uiInteraction(.swipeAction())),
                HapticButton(title: "Toggle Switch", subtitle: "Satisfying state change", hapticOption: .uiInteraction(.toggleSwitch())),
                HapticButton(title: "Picker Detent", subtitle: "Mechanical wheel click", hapticOption: .uiInteraction(.pickerDetent())),
                HapticButton(title: "Long Press", subtitle: "Building pressure activation", hapticOption: .uiInteraction(.longPressActivation())),
                HapticButton(title: "Tab Selection", subtitle: "Clean section transition", hapticOption: .uiInteraction(.tabSelection())),
                HapticButton(title: "Keyboard Tap", subtitle: "Realistic key press", hapticOption: .uiInteraction(.keyboardTap())),
                HapticButton(title: "Slider Step", subtitle: "Discrete value change", hapticOption: .uiInteraction(.sliderStep())),
                HapticButton(title: "Selection Tick", subtitle: "Multi-select feedback", hapticOption: .uiInteraction(.selectionTick())),
                HapticButton(title: "Segment Change", subtitle: "Section switch", hapticOption: .uiInteraction(.segmentChange())),
                HapticButton(title: "Navigation Push", subtitle: "Forward screen transition", hapticOption: .uiInteraction(.navigationPush())),
                HapticButton(title: "Navigation Pop", subtitle: "Back screen transition", hapticOption: .uiInteraction(.navigationPop())),
                HapticButton(title: "Modal Present", subtitle: "Sheet appearance", hapticOption: .uiInteraction(.modalPresent())),
                HapticButton(title: "Modal Dismiss", subtitle: "Sheet dismissal", hapticOption: .uiInteraction(.modalDismiss())),
                HapticButton(title: "Zoom Boundary", subtitle: "Elastic zoom limit", hapticOption: .uiInteraction(.zoomBoundary())),
                HapticButton(title: "Drag & Drop", subtitle: "Complete drag operation", hapticOption: .uiInteraction(.dragAndDrop())),
                HapticButton(title: "Form Submit", subtitle: "Submission confirmation", hapticOption: .uiInteraction(.formSubmit())),
                HapticButton(title: "Input Error", subtitle: "Validation failure", hapticOption: .uiInteraction(.inputError())),
                HapticButton(title: "Loading Complete", subtitle: "Async operation finished", hapticOption: .uiInteraction(.loadingComplete())),
                HapticButton(title: "App Icon Tap", subtitle: "Springy launch feedback", hapticOption: .uiInteraction(.appIconTap())),
                HapticButton(title: "Custom Pop", subtitle: "Maximum intensity tap", hapticOption: .uiInteraction(.customPop())),
                HapticButton(title: "Pop", subtitle: "Apple-inspired pop", hapticOption: .uiInteraction(.pop())),
            ]
        ),
        
        HapticCategory(
            name: "Special Effects",
            icon: "sparkles",
            description: "Magical and special visual effects",
            count: 10,
            buttons: [
                HapticButton(title: "Magic Sparkle", subtitle: "Random shimmer taps", hapticOption: .specialEffect(.magicSparkle())),
                HapticButton(title: "Water Drop", subtitle: "Drop with ripple effect", hapticOption: .specialEffect(.waterDrop())),
                HapticButton(title: "Earthquake", subtitle: "Violent ground shaking", hapticOption: .specialEffect(.earthquake())),
                HapticButton(title: "Laser Beam", subtitle: "Sharp start with beam", hapticOption: .specialEffect(.laserBeam())),
                HapticButton(title: "Typewriter", subtitle: "Mechanical click", hapticOption: .specialEffect(.typewriter())),
                HapticButton(title: "Rubber Band", subtitle: "Elastic stretch and snap", hapticOption: .specialEffect(.rubberBand())),
                HapticButton(title: "Electric Spark", subtitle: "Sharp electrical discharge", hapticOption: .specialEffect(.electricSpark())),
                HapticButton(title: "Boing", subtitle: "Bouncy spring effect", hapticOption: .specialEffect(.boing())),
                HapticButton(title: "Inflate", subtitle: "Swelling effect", hapticOption: .specialEffect(.inflate())),
                HapticButton(title: "Oscillate", subtitle: "Vibrating pattern", hapticOption: .specialEffect(.oscillate())),
            ]
        ),
        
        HapticCategory(
            name: "Wellness",
            icon: "heart.circle",
            description: "Meditation and wellness haptics",
            count: 6,
            buttons: [
                HapticButton(title: "Breathing Guide", subtitle: "Inhale-hold-exhale rhythm", hapticOption: .wellness(.breathingGuide())),
                HapticButton(title: "Calm Pulse", subtitle: "Gentle heartbeat rhythm", hapticOption: .wellness(.calmPulse())),
                HapticButton(title: "Meditation Bell", subtitle: "Peaceful chime", hapticOption: .wellness(.meditationBell())),
                HapticButton(title: "Relaxation Wave", subtitle: "Flowing wave motion", hapticOption: .wellness(.relaxationWave())),
                HapticButton(title: "Zen Notification", subtitle: "Mindful alert", hapticOption: .wellness(.zenNotification())),
                HapticButton(title: "Heartbeats", subtitle: "Rhythmic pulse (3 beats)", hapticOption: .wellness(.heartBeats())),
            ]
        ),
        
        HapticCategory(
            name: "Productivity",
            icon: "checkmark.circle",
            description: "Work and productivity applications",
            count: 4,
            buttons: [
                HapticButton(title: "Timer Complete", subtitle: "Time's up notification", hapticOption: .productivity(.timerComplete())),
                HapticButton(title: "Task Check", subtitle: "Satisfying completion", hapticOption: .productivity(.taskCheck())),
                HapticButton(title: "Focus Start", subtitle: "Focus session beginning", hapticOption: .productivity(.focusStart())),
                HapticButton(title: "Break Reminder", subtitle: "Time for a break", hapticOption: .productivity(.breakReminder())),
            ]
        ),
        
        HapticCategory(
            name: "Finance",
            icon: "creditcard",
            description: "Payment and transaction haptics",
            count: 4,
            buttons: [
                HapticButton(title: "Payment Success", subtitle: "Confident confirmation", hapticOption: .finance(.paymentSuccess())),
                HapticButton(title: "Payment Processing", subtitle: "Subtle processing pulse", hapticOption: .finance(.paymentProcessing())),
                HapticButton(title: "Transaction Alert", subtitle: "Transaction notification", hapticOption: .finance(.transactionAlert())),
                HapticButton(title: "Receipt Saved", subtitle: "Receipt confirmation", hapticOption: .finance(.receiptSaved())),
            ]
        ),
        
        HapticCategory(
            name: "Emotional",
            icon: "face.smiling",
            description: "Emotional state haptic patterns",
            count: 5,
            buttons: [
                HapticButton(title: "Excitement Build", subtitle: "Accelerating anticipation", hapticOption: .emotional(.excitementBuild())),
                HapticButton(title: "Disappointment", subtitle: "Descending energy drain", hapticOption: .emotional(.disappointment())),
                HapticButton(title: "Surprise", subtitle: "Sudden burst reveal", hapticOption: .emotional(.surprise())),
                HapticButton(title: "Joy", subtitle: "Happy celebration", hapticOption: .emotional(.joy())),
                HapticButton(title: "Anticipation", subtitle: "Building excitement", hapticOption: .emotional(.anticipation())),
            ]
        ),
        
        HapticCategory(
            name: "Intense Gamification",
            icon: "bolt.fill",
            description: "Epic abilities and powerful effects",
            count: 20,
            buttons: [
                // Elemental Powers
                HapticButton(title: "Fire Burst", subtitle: "Explosive flame blast", hapticOption: .intenseGamification(.fireBurst())),
                HapticButton(title: "Ice Shard", subtitle: "Crystalline freeze attack", hapticOption: .intenseGamification(.iceShard())),
                HapticButton(title: "Earthquake Rumble", subtitle: "Violent earth tremor", hapticOption: .intenseGamification(.earthquakeRumble())),
                HapticButton(title: "Wind Tornado", subtitle: "Swirling vortex of air", hapticOption: .intenseGamification(.windTornado())),
                // Space/Sci-Fi
                HapticButton(title: "Plasma Charge", subtitle: "Energy weapon charging", hapticOption: .intenseGamification(.plasmaCharge())),
                HapticButton(title: "Gravity Well", subtitle: "Space-time distortion", hapticOption: .intenseGamification(.gravityWell())),
                HapticButton(title: "Photon Blast", subtitle: "Light speed attack", hapticOption: .intenseGamification(.photonBlast())),
                HapticButton(title: "Quantum Shift", subtitle: "Reality phase change", hapticOption: .intenseGamification(.quantumShift())),
                HapticButton(title: "Rocket Launch", subtitle: "Ignition and liftoff", hapticOption: .intenseGamification(.rocketLaunch())),
                HapticButton(title: "Warp Drive", subtitle: "Faster-than-light jump", hapticOption: .intenseGamification(.warpDrive())),
                HapticButton(title: "Laser Cannon", subtitle: "Concentrated energy beam", hapticOption: .intenseGamification(.laserCannon())),
                HapticButton(title: "Alien Teleport", subtitle: "Otherworldly phase shift", hapticOption: .intenseGamification(.alienTeleport())),
                HapticButton(title: "Space Explosion", subtitle: "Decompression blast", hapticOption: .intenseGamification(.spaceExplosion())),
                // Epic Abilities
                HapticButton(title: "Ultimate Power", subtitle: "Maximum energy release", hapticOption: .intenseGamification(.ultimatePower())),
                HapticButton(title: "Dragon Roar", subtitle: "Primal draconic bellow", hapticOption: .intenseGamification(.dragonRoar())),
                HapticButton(title: "Titan Smash", subtitle: "Colossal impact force", hapticOption: .intenseGamification(.titanSmash())),
                HapticButton(title: "Dimensional Rift", subtitle: "Reality tear", hapticOption: .intenseGamification(.dimensionalRift())),
                HapticButton(title: "Volcanic Eruption", subtitle: "Explosive magma blast", hapticOption: .intenseGamification(.volcanicEruption())),
                // Power-ups
                HapticButton(title: "Mega Boost", subtitle: "Explosive power surge", hapticOption: .intenseGamification(.megaBoost())),
                HapticButton(title: "Star Power", subtitle: "Celestial energy", hapticOption: .intenseGamification(.starPower())),
            ]
        ),
    ]
    
    var filteredCategories: [HapticCategory] {
        if searchText.isEmpty {
            return categories
        }
        
        return categories.filter { category in
            category.name.localizedCaseInsensitiveContains(searchText) ||
            category.description.localizedCaseInsensitiveContains(searchText) ||
            category.buttons.contains { button in
                button.title.localizedCaseInsensitiveContains(searchText) ||
                button.subtitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCategories) { category in
                    NavigationLink(destination: HapticCategoryView(category: category, haptics: haptics)) {
                        HStack {
                            Image(systemName: category.icon)
                                .foregroundColor(.accentColor)
                                .font(.title2)
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(category.name)
                                    .font(.headline)
                                Text(category.description)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("\(category.count)")
                                    .font(.title2.bold())
                                    .foregroundColor(.accentColor)
                                Text("patterns")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Haptic Categories")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search categories")
        }
    }
}

struct HapticCategoryView: View {
    let category: HapticCategory
    let haptics: HapticManager
    @State private var searchText = ""
    
    var filteredButtons: [HapticButton] {
        if searchText.isEmpty {
            return category.buttons
        }
        
        return category.buttons.filter { button in
            button.title.localizedCaseInsensitiveContains(searchText) ||
            button.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(filteredButtons, id: \.title) { button in
                    Button(action: {
                        haptics.play(option: button.hapticOption)
                    }) {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(button.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(button.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(.accentColor)
                                .font(.title)
                        }
                        .padding(.vertical, 8)
                    }
                }
            } header: {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: category.icon)
                            .foregroundColor(.accentColor)
                            .font(.title2)
                        Text("\(category.count) Patterns")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Text(category.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 4)
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Search \(category.name)")
    }
}

#Preview {
    ContentView()
}