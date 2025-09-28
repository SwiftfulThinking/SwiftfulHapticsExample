//
//  ContentView.swift
//  SwiftfulHapticsExample
//
//  Created by Nick Sarno on 5/19/24.
//

import SwiftUI
import SwiftfulHaptics

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
    private let hapticManager = HapticManager()
    @State private var searchText = ""
    
    let categories: [HapticCategory] = [
        HapticCategory(
            name: "SwiftfulHaptics Built-in",
            icon: "waveform",
            description: "Pre-built haptic patterns from SwiftfulHaptics library",
            count: 12,
            buttons: [
                HapticButton(title: "Boing", subtitle: "Bouncy spring effect", hapticOption: .specialEffect(.boing())),
                HapticButton(title: "Heartbeat", subtitle: "Rhythmic pulse", hapticOption: .wellness(.heartBeats())),
                HapticButton(title: "Drums", subtitle: "Complex drum pattern", hapticOption: .gaming(.drums)),
                HapticButton(title: "Pop", subtitle: "Sharp instant feedback", hapticOption: .uiInteraction(.pop())),
                HapticButton(title: "Inflate", subtitle: "Swelling effect", hapticOption: .specialEffect(.inflate())),
                HapticButton(title: "Oscillate", subtitle: "Vibrating pattern", hapticOption: .specialEffect(.oscillate())),
                HapticButton(title: "Light Impact", subtitle: "Gentle tap", hapticOption: .basic(.light)),
                HapticButton(title: "Medium Impact", subtitle: "Standard tap", hapticOption: .basic(.medium)),
                HapticButton(title: "Heavy Impact", subtitle: "Strong tap", hapticOption: .basic(.heavy)),
                HapticButton(title: "Success", subtitle: "Notification success", hapticOption: .basic(.success)),
                HapticButton(title: "Warning", subtitle: "Notification warning", hapticOption: .basic(.warning)),
                HapticButton(title: "Error", subtitle: "Notification error", hapticOption: .basic(.error)),
            ]
        ),
        
        HapticCategory(
            name: "Gaming Effects",
            icon: "gamecontroller",
            description: "Combat, magic, and action game haptics",
            count: 18,
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
                // Other
                HapticButton(title: "Machine Gun", subtitle: "Rapid-fire pulses", hapticOption: .gaming(.machineGun())),
                HapticButton(title: "Magic Charge", subtitle: "Building magical energy", hapticOption: .gaming(.magicCharge())),
                HapticButton(title: "Portal Enter", subtitle: "Warping sensation", hapticOption: .gaming(.portalEnter())),
            ]
        ),
        
        HapticCategory(
            name: "Educational Achievement",
            icon: "star.fill",
            description: "Success, rewards, and positive feedback",
            count: 12,
            buttons: [
                HapticButton(title: "Correct Answer - Basic", subtitle: "Light confirmation tap", hapticOption: .educational(.correctAnswerBasic())),
                HapticButton(title: "Correct Answer - Simple", subtitle: "Single positive tap", hapticOption: .educational(.correctAnswerSimple())),
                HapticButton(title: "Correct Answer - Streak", subtitle: "Building excitement", hapticOption: .educational(.correctAnswerStreak())),
                HapticButton(title: "Correct Answer - Perfect", subtitle: "Triumphant celebration", hapticOption: .educational(.correctAnswerPerfect())),
                HapticButton(title: "Perfect Lesson", subtitle: "Grand celebration", hapticOption: .educational(.perfectLessonComplete())),
                HapticButton(title: "Badge Unlock", subtitle: "Medal achievement", hapticOption: .educational(.badgeUnlock())),
                HapticButton(title: "Level Up", subtitle: "Energy burst celebration", hapticOption: .educational(.levelUp())),
                HapticButton(title: "Skill Mastery", subtitle: "Crown placement flourish", hapticOption: .educational(.skillMastery())),
                HapticButton(title: "League Promotion", subtitle: "Victory fanfare", hapticOption: .educational(.leaguePromotion())),
                HapticButton(title: "Lesson Complete", subtitle: "Satisfying completion", hapticOption: .educational(.lessonComplete())),
                HapticButton(title: "Celebration Burst", subtitle: "Firework-like taps", hapticOption: .educational(.celebrationBurst())),
                HapticButton(title: "Ascending Success", subtitle: "Three increasing taps", hapticOption: .educational(.ascendingSuccess())),
            ]
        ),
        
        HapticCategory(
            name: "Educational Learning",
            icon: "lightbulb",
            description: "Hints, mistakes, and learning feedback",
            count: 11,
            buttons: [
                HapticButton(title: "Wrong Answer - Gentle", subtitle: "Soft buzz for kids", hapticOption: .educational(.wrongAnswerGentle())),
                HapticButton(title: "Wrong Answer - Standard", subtitle: "Clear error indication", hapticOption: .educational(.wrongAnswerStandard())),
                HapticButton(title: "Near Miss Answer", subtitle: "Almost correct - encouraging", hapticOption: .educational(.nearMissAnswer())),
                HapticButton(title: "Grammar Error", subtitle: "Gentle wave for mistakes", hapticOption: .educational(.grammarError())),
                HapticButton(title: "Hint Activation", subtitle: "Subtle guidance pulse", hapticOption: .educational(.hintActivation())),
                HapticButton(title: "Hint Reveal", subtitle: "Gentle nudge", hapticOption: .educational(.hintReveal())),
                HapticButton(title: "Time Critical Warning", subtitle: "Final 5 seconds escalation", hapticOption: .educational(.timeCriticalWarning())),
                HapticButton(title: "Partial Credit", subtitle: "Positive partial correctness", hapticOption: .educational(.partialCredit())),
                HapticButton(title: "Try Again", subtitle: "Motivating encouragement", hapticOption: .educational(.tryAgainEncouragement())),
                HapticButton(title: "Learning Progress", subtitle: "Milestone acknowledgment", hapticOption: .educational(.learningProgress())),
                HapticButton(title: "Focus Reminder", subtitle: "Gentle attention getter", hapticOption: .educational(.focusReminder())),
            ]
        ),
        
        HapticCategory(
            name: "Streaks & Milestones",
            icon: "flame.fill",
            description: "Streak tracking and milestone celebrations",
            count: 11,
            buttons: [
                HapticButton(title: "Streak Risk Warning", subtitle: "About to lose streak", hapticOption: .educational(.streakRiskWarning())),
                HapticButton(title: "Streak Lost", subtitle: "Empathetic acknowledgment", hapticOption: .educational(.streakLost())),
                HapticButton(title: "Streak Building - 3", subtitle: "3 correct answers", hapticOption: .educational(.streakBuilding(streakCount: 3))),
                HapticButton(title: "Streak Building - 7", subtitle: "7 streak with fire effect", hapticOption: .educational(.streakBuilding(streakCount: 7))),
                HapticButton(title: "Streak Building - 10", subtitle: "10 streak celebration", hapticOption: .educational(.streakBuilding(streakCount: 10))),
                HapticButton(title: "Streak Milestone - 5", subtitle: "Light celebration", hapticOption: .educational(.streakMilestone5())),
                HapticButton(title: "Streak Milestone - 7 Days", subtitle: "Weekly achievement", hapticOption: .educational(.streakMilestone7Days())),
                HapticButton(title: "Streak Milestone - 10", subtitle: "Medium celebration", hapticOption: .educational(.streakMilestone10())),
                HapticButton(title: "Streak Milestone - 25", subtitle: "Major celebration", hapticOption: .educational(.streakMilestone25())),
                HapticButton(title: "Streak Milestone - 30 Days", subtitle: "Monthly achievement", hapticOption: .educational(.streakMilestone30Days())),
                HapticButton(title: "Streak Milestone - 100 Days", subtitle: "Epic achievement", hapticOption: .educational(.streakMilestone100Days())),
            ]
        ),
        
        HapticCategory(
            name: "XP & Progress",
            icon: "chart.line.uptrend.xyaxis",
            description: "Experience points and progress tracking",
            count: 11,
            buttons: [
                HapticButton(title: "XP Gain - Small", subtitle: "Quick XP collection", hapticOption: .educational(.xpGainSmall())),
                HapticButton(title: "XP Gain - Large", subtitle: "Big XP reward", hapticOption: .educational(.xpGainLarge())),
                HapticButton(title: "XP Gain - Bonus", subtitle: "Exciting bonus XP", hapticOption: .educational(.xpGainBonus())),
                HapticButton(title: "XP Gain - 10 XP", subtitle: "Small XP collection", hapticOption: .educational(.xpGainDynamic(xpAmount: 10))),
                HapticButton(title: "XP Gain - 50 XP", subtitle: "Medium XP with rumble", hapticOption: .educational(.xpGainDynamic(xpAmount: 50))),
                HapticButton(title: "XP Gain - 100 XP", subtitle: "Large XP celebration", hapticOption: .educational(.xpGainDynamic(xpAmount: 100))),
                HapticButton(title: "Progress 25%", subtitle: "Quarter milestone tap", hapticOption: .educational(.progress25())),
                HapticButton(title: "Progress 50%", subtitle: "Halfway double tap", hapticOption: .educational(.progress50())),
                HapticButton(title: "Progress 75%", subtitle: "Three-quarter triple tap", hapticOption: .educational(.progress75())),
                HapticButton(title: "Progress Bar 0-25%", subtitle: "Quarter progress", hapticOption: .educational(.progressBarFilling(startPercent: 0.0, endPercent: 0.25))),
                HapticButton(title: "Progress Bar 75-100%", subtitle: "Completion with celebration", hapticOption: .educational(.progressBarFilling(startPercent: 0.75, endPercent: 1.0))),
            ]
        ),
        
        HapticCategory(
            name: "Educational Gamification",
            icon: "trophy.fill",
            description: "Challenges, power-ups, and competitive elements",
            count: 10,
            buttons: [
                HapticButton(title: "Daily Goal - Checkpoint 1", subtitle: "First checkpoint reached", hapticOption: .educational(.dailyGoalCheckpoint(checkpointNumber: 1))),
                HapticButton(title: "Daily Goal - Checkpoint 3", subtitle: "Third checkpoint celebration", hapticOption: .educational(.dailyGoalCheckpoint(checkpointNumber: 3))),
                HapticButton(title: "League Advancement", subtitle: "Promoted to new league", hapticOption: .educational(.leagueAdvancement())),
                HapticButton(title: "Crown Collection", subtitle: "Magical crown/gem pickup", hapticOption: .educational(.crownGemCollection())),
                HapticButton(title: "Streak Freeze Power-Up", subtitle: "Icy crystallization effect", hapticOption: .educational(.powerUpActivation(powerUpType: "streakFreeze"))),
                HapticButton(title: "Double or Nothing Power-Up", subtitle: "Double pulse activation", hapticOption: .educational(.powerUpActivation(powerUpType: "doubleOrNothing"))),
                HapticButton(title: "Challenge Complete - Standard", subtitle: "Normal challenge completion", hapticOption: .educational(.challengeCompletion(isPerfect: false))),
                HapticButton(title: "Challenge Complete - Perfect", subtitle: "Perfect run celebration", hapticOption: .educational(.challengeCompletion(isPerfect: true))),
                HapticButton(title: "Lesson Node Unlock", subtitle: "Path opens up", hapticOption: .educational(.lessonPathProgress(nodeType: "unlock"))),
                HapticButton(title: "Lesson Node Complete", subtitle: "Golden completion", hapticOption: .educational(.lessonPathProgress(nodeType: "complete"))),
            ]
        ),
        
        HapticCategory(
            name: "Intense Gamification",
            icon: "bolt.fill",
            description: "Epic abilities and powerful effects",
            count: 20,
            buttons: [
                // Elemental Powers
                HapticButton(title: "Thunder Storm", subtitle: "Massive electrical discharge", hapticOption: .intenseGamification(.thunderStorm())),
                HapticButton(title: "Meteor Impact", subtitle: "Catastrophic collision", hapticOption: .intenseGamification(.meteorImpact())),
                HapticButton(title: "Earthquake", subtitle: "Violent ground shaking", hapticOption: .intenseGamification(.earthquake())),
                HapticButton(title: "Tornado", subtitle: "Rotating vortex of destruction", hapticOption: .intenseGamification(.tornado())),
                HapticButton(title: "Volcanic Eruption", subtitle: "Explosive magma blast", hapticOption: .intenseGamification(.volcanicEruption())),
                // Space/Sci-Fi
                HapticButton(title: "Rocket Launch", subtitle: "Ignition and liftoff", hapticOption: .intenseGamification(.rocketLaunch())),
                HapticButton(title: "Warp Drive", subtitle: "Faster-than-light jump", hapticOption: .intenseGamification(.warpDrive())),
                HapticButton(title: "Laser Cannon", subtitle: "Concentrated energy beam", hapticOption: .intenseGamification(.laserCannon())),
                HapticButton(title: "Alien Teleport", subtitle: "Otherworldly phase shift", hapticOption: .intenseGamification(.alienTeleport())),
                HapticButton(title: "Space Explosion", subtitle: "Decompression blast", hapticOption: .intenseGamification(.spaceExplosion())),
                // Epic Abilities
                HapticButton(title: "Titan Stomp", subtitle: "Giant footfall impact", hapticOption: .intenseGamification(.titanStomp())),
                HapticButton(title: "Dragon Roar", subtitle: "Primal draconic bellow", hapticOption: .intenseGamification(.dragonRoar())),
                HapticButton(title: "Phoenix Rebirth", subtitle: "Fiery resurrection", hapticOption: .intenseGamification(.phoenixRebirth())),
                HapticButton(title: "Berserker Rage", subtitle: "Uncontrollable fury", hapticOption: .intenseGamification(.berserkerRage())),
                HapticButton(title: "Divine Intervention", subtitle: "Heavenly power descends", hapticOption: .intenseGamification(.divineIntervention())),
                // Power-Ups
                HapticButton(title: "Mega Boost", subtitle: "Explosive power surge", hapticOption: .intenseGamification(.megaBoost())),
                HapticButton(title: "Invincibility", subtitle: "Shield activation", hapticOption: .intenseGamification(.invincibilityActivation())),
                HapticButton(title: "Time Freeze", subtitle: "Reality crystallization", hapticOption: .intenseGamification(.timeFreeze())),
                HapticButton(title: "Ultra Combo", subtitle: "Devastating chain attack", hapticOption: .intenseGamification(.ultraCombo())),
                HapticButton(title: "Nuclear Charge", subtitle: "Critical mass explosion", hapticOption: .intenseGamification(.nuclearCharge())),
            ]
        ),
        
        HapticCategory(
            name: "UI & Interaction",
            icon: "hand.tap",
            description: "User interface and interaction patterns",
            count: 30,
            buttons: [
                HapticButton(title: "Double Tap Like", subtitle: "Quick double pulse", hapticOption: .uiInteraction(.doubleTapLike())),
                HapticButton(title: "Message Sent", subtitle: "Swoosh with fade", hapticOption: .uiInteraction(.messageSent())),
                HapticButton(title: "Notification Pop", subtitle: "Attention-grabbing pop", hapticOption: .uiInteraction(.notificationPop())),
                HapticButton(title: "Rubber Band", subtitle: "Elastic stretch and snap", hapticOption: .specialEffect(.rubberBand())),
                HapticButton(title: "Task Check", subtitle: "Satisfying completion", hapticOption: .productivity(.taskCheck())),
                HapticButton(title: "Book Page Turn", subtitle: "Page flipping feel", hapticOption: .uiInteraction(.pageTurn())),
                HapticButton(title: "Flashcard Flip", subtitle: "Card flipping feel", hapticOption: .uiInteraction(.pageFlip())),
                HapticButton(title: "Quiz Start", subtitle: "Ready-set-go pattern", hapticOption: .educational(.lessonComplete())),
                HapticButton(title: "Soft Tick", subtitle: "Fine ratchet feeling", hapticOption: .uiInteraction(.selectionTick())),
                // Advanced UI Patterns
                HapticButton(title: "Pull to Refresh", subtitle: "Elastic tension release", hapticOption: .uiInteraction(.pullToRefresh())),
                HapticButton(title: "Swipe to Delete", subtitle: "Progressive delete feedback", hapticOption: .uiInteraction(.swipeAction(actionType: "delete"))),
                HapticButton(title: "Swipe to Archive", subtitle: "Progressive archive feedback", hapticOption: .uiInteraction(.swipeAction(actionType: "archive"))),
                HapticButton(title: "Toggle Switch", subtitle: "Satisfying state change", hapticOption: .uiInteraction(.toggleSwitch())),
                HapticButton(title: "Picker Detent", subtitle: "Mechanical wheel click", hapticOption: .uiInteraction(.pickerDetent())),
                HapticButton(title: "Long Press", subtitle: "Building pressure activation", hapticOption: .uiInteraction(.longPressActivation())),
                HapticButton(title: "Tab Selection", subtitle: "Clean section transition", hapticOption: .uiInteraction(.tabSelection())),
                HapticButton(title: "Keyboard Tap", subtitle: "Realistic key press", hapticOption: .uiInteraction(.keyboardTap())),
                HapticButton(title: "Zoom Boundary", subtitle: "Elastic zoom limit", hapticOption: .uiInteraction(.zoomBoundary())),
                HapticButton(title: "Drag & Drop", subtitle: "Complete drag operation", hapticOption: .uiInteraction(.dragAndDrop())),
                HapticButton(title: "Selection Tick", subtitle: "Multi-select feedback", hapticOption: .uiInteraction(.selectionTick())),
                HapticButton(title: "Slider Step", subtitle: "Discrete value change", hapticOption: .uiInteraction(.sliderStep())),
                HapticButton(title: "Navigation Push", subtitle: "Forward screen transition", hapticOption: .uiInteraction(.navigationPush())),
                HapticButton(title: "Navigation Pop", subtitle: "Back screen transition", hapticOption: .uiInteraction(.navigationPop())),
                HapticButton(title: "Modal Present", subtitle: "Sheet appearance", hapticOption: .uiInteraction(.modalPresent())),
                HapticButton(title: "Modal Dismiss", subtitle: "Sheet dismissal", hapticOption: .uiInteraction(.modalDismiss())),
                HapticButton(title: "Segment Change", subtitle: "Section switch", hapticOption: .uiInteraction(.segmentChange())),
                HapticButton(title: "Form Submit", subtitle: "Submission confirmation", hapticOption: .uiInteraction(.formSubmit())),
                HapticButton(title: "Input Error", subtitle: "Validation failure", hapticOption: .uiInteraction(.inputError())),
                HapticButton(title: "Loading Complete", subtitle: "Async operation finished", hapticOption: .uiInteraction(.loadingComplete())),
                HapticButton(title: "App Icon Tap", subtitle: "Springy launch feedback", hapticOption: .uiInteraction(.appIconTap())),
                HapticButton(title: "Custom Pop", subtitle: "Maximum intensity tap", hapticOption: .uiInteraction(.customPop())),
            ]
        ),
        
        HapticCategory(
            name: "Special Effects",
            icon: "sparkles",
            description: "Magical and special visual effects",
            count: 7,
            buttons: [
                HapticButton(title: "Magic Sparkle", subtitle: "Random shimmer taps", hapticOption: .specialEffect(.magicSparkle())),
                HapticButton(title: "Water Drop", subtitle: "Drop with ripple effect", hapticOption: .specialEffect(.waterDrop())),
                HapticButton(title: "Laser Beam", subtitle: "Sharp start with beam", hapticOption: .specialEffect(.laserBeam())),
                HapticButton(title: "Typewriter", subtitle: "Mechanical click", hapticOption: .specialEffect(.typewriter())),
                HapticButton(title: "Cascade", subtitle: "Building intensity", hapticOption: .gaming(.cascade())),
                HapticButton(title: "Build Up", subtitle: "Gradual intensity increase", hapticOption: .specialEffect(.buildUp())),
                HapticButton(title: "Elastic Bounce", subtitle: "Bouncing ball effect", hapticOption: .gaming(.elasticBounce())),
            ]
        ),
        
        HapticCategory(
            name: "Wellness & Timer",
            icon: "heart.circle",
            description: "Meditation and timing haptics",
            count: 5,
            buttons: [
                HapticButton(title: "Breathing Guide", subtitle: "Inhale-hold-exhale rhythm", hapticOption: .wellness(.breathingGuide())),
                HapticButton(title: "Calm Pulse", subtitle: "Gentle heartbeat rhythm", hapticOption: .wellness(.calmPulse())),
                HapticButton(title: "Timer Complete", subtitle: "Extended declining vibration", hapticOption: .productivity(.timerComplete())),
                HapticButton(title: "Time Warning - 30s", subtitle: "Gentle reminder", hapticOption: .wellness(.timeWarning30s())),
                HapticButton(title: "Time Warning - 10s", subtitle: "Urgent double pulse", hapticOption: .wellness(.timeWarning10s())),
            ]
        ),
        
        HapticCategory(
            name: "Movement & Physics",
            icon: "figure.walk",
            description: "Physical movement and vehicle haptics",
            count: 4,
            buttons: [
                HapticButton(title: "Footstep - Grass", subtitle: "Soft, muffled step", hapticOption: .gaming(.footstepGrass())),
                HapticButton(title: "Footstep - Metal", subtitle: "Hard, clanking step", hapticOption: .gaming(.footstepMetal())),
                HapticButton(title: "Engine Start", subtitle: "Ignition with engine rumble", hapticOption: .gaming(.engineStart())),
                HapticButton(title: "Turbo Boost", subtitle: "Acceleration surge", hapticOption: .gaming(.turboBoost())),
            ]
        ),
        
        HapticCategory(
            name: "Ratings & Feedback",
            icon: "star.circle",
            description: "Rating systems and social feedback",
            count: 5,
            buttons: [
                HapticButton(title: "Star Rating - 1", subtitle: "Single star tap", hapticOption: .ratingsFeedback(.starRating1())),
                HapticButton(title: "Star Rating - 3", subtitle: "Three ascending taps", hapticOption: .ratingsFeedback(.starRating3())),
                HapticButton(title: "Star Rating - 5", subtitle: "Five star celebration", hapticOption: .ratingsFeedback(.starRating5())),
                HapticButton(title: "Friend Achievement", subtitle: "Social notification", hapticOption: .educational(.socialFeatureNotification(notificationType: "friendAchievement"))),
                HapticButton(title: "Leaderboard Change", subtitle: "Ranking update alert", hapticOption: .educational(.socialFeatureNotification(notificationType: "leaderboardChange"))),
            ]
        ),
        
        HapticCategory(
            name: "Finance & Commerce",
            icon: "creditcard",
            description: "Payment and transaction haptics",
            count: 2,
            buttons: [
                HapticButton(title: "Payment Success", subtitle: "Confident confirmation", hapticOption: .finance(.paymentSuccess())),
                HapticButton(title: "Payment Processing", subtitle: "Subtle processing pulse", hapticOption: .finance(.paymentProcessing())),
            ]
        ),
        
        HapticCategory(
            name: "Emotional",
            icon: "face.smiling",
            description: "Emotional state haptic patterns",
            count: 3,
            buttons: [
                HapticButton(title: "Excitement Build", subtitle: "Accelerating anticipation", hapticOption: .emotional(.excitementBuild())),
                HapticButton(title: "Disappointment", subtitle: "Descending energy drain", hapticOption: .emotional(.disappointment())),
                HapticButton(title: "Surprise", subtitle: "Sudden burst reveal", hapticOption: .emotional(.surprise())),
            ]
        ),
        
        HapticCategory(
            name: "Tools & Writing",
            icon: "pencil",
            description: "Writing and tool-based haptics",
            count: 2,
            buttons: [
                HapticButton(title: "Pencil Write", subtitle: "Scratchy writing feel", hapticOption: .toolsWriting(.pencilWrite())),
                HapticButton(title: "Eraser Use", subtitle: "Rubbing sensation", hapticOption: .toolsWriting(.eraserUse())),
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
                    NavigationLink(destination: HapticCategoryView(category: category, hapticManager: hapticManager)) {
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
    let hapticManager: HapticManager
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
                        hapticManager.play(option: button.hapticOption)
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
